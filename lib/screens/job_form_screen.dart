import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../services/job_database.dart';
import '../services/quote_service.dart';

class JobFormScreen extends StatefulWidget {
  const JobFormScreen({super.key});

  @override
  State<JobFormScreen> createState() => _JobFormScreenState();
}

class _JobFormScreenState extends State<JobFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final hoursController = TextEditingController();

  String quote = '';

  void calculateQuote() {
    final hours = double.tryParse(hoursController.text);
    if (hours != null) {
      final total = QuoteService.calculateQuote(hours);
      setState(() {
        quote = QuoteService.formatQuote(total);
      });
    }
  }

  void saveJob() async {
    if (_formKey.currentState!.validate()) {
      final job = Job(
        customerName: nameController.text,
        address: addressController.text,
        scheduledTime: DateTime.now().toString(),
        status: 'Pending',
      );
      await JobDatabase.instance.create(job);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Job saved successfully')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Job')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Customer Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Enter customer name' : null,
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) =>
                    value!.isEmpty ? 'Enter address' : null,
              ),
              TextFormField(
                controller: hoursController,
                decoration:
                    const InputDecoration(labelText: 'Estimated Hours'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Enter estimated hours' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateQuote,
                child: const Text('Calculate Quote'),
              ),
              const SizedBox(height: 10),
              Text(
                'Quote: $quote',
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: saveJob,
                child: const Text('Save Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
