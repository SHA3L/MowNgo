class Job {
  final int? id;
  final String customerName;
  final String address;
  final String scheduledTime;
  final String status;

  Job({
    this.id,
    required this.customerName,
    required this.address,
    required this.scheduledTime,
    this.status = 'Pending',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerName': customerName,
      'address': address,
      'scheduledTime': scheduledTime,
      'status': status,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      id: map['id'],
      customerName: map['customerName'],
      address: map['address'],
      scheduledTime: map['scheduledTime'],
      status: map['status'],
    );
  }
}
