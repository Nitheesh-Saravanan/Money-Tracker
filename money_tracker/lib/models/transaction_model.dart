class Transaction {
  final int? tranId;
  final String timeStamp;
  final String type;
  final String category;
  final String? description;
  final int value;
  final String? location;
  final String mode;
  final int? personInvolved;
  final int status;

  // Constructor
  Transaction({
    this.tranId,
    required this.timeStamp,
    required this.type,
    required this.category,
    this.description,
    required this.value,
    this.location,
    required this.mode,
    this.personInvolved,
    required this.status,
  });

  // Define fromMap
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      tranId: map['tran_id'] as int?,
      timeStamp: map['time_stamp'] as String,
      type: map['type'] as String,
      category: map['category'] as String,
      description: map['description'] as String?,
      value: map['value'] as int,
      location: map['location'] as String?,
      mode: map['mode'] as String,
      personInvolved: map['person_involved'] as int?,
      status: map['status'] as int,
    );
  }

  // Define toMap
  Map<String, dynamic> toMap() {
    return {
      'tran_id': tranId,
      'time_stamp': timeStamp,
      'type': type,
      'category': category,
      'description': description,
      'value': value,
      'location': location,
      'mode': mode,
      'person_involved': personInvolved,
      'status': status,
    };
  }
}
