class GetAllAccounts {
  final int accountId;
  final String? dateCreated;
  final String? dateUpdated;
  final int? lenderId;
  final int? borrowerId;
  final double? total;
  final double? available;
  final double? owed;

  GetAllAccounts({
    required this.accountId,
    this.dateCreated,
    this.dateUpdated,
    this.lenderId,
    this.borrowerId,
    this.total,
    this.available,
    this.owed,
  });

  factory GetAllAccounts.fromJson(Map<String, dynamic> json) {
    return GetAllAccounts(
      accountId: json['account_id'] ?? 0,
      dateCreated: json['date_created'] ?? '',
      dateUpdated: json['date_updated'] ?? '',
      lenderId: json['lender_id'] != null
          ? int.tryParse(json['lender_id'].toString())
          : null,
      borrowerId: json['borrower_id'] != null
          ? int.tryParse(json['borrower_id'].toString())
          : null,
      total: json['total'] != null
          ? double.tryParse(json['total'].toString())
          : null,
      available: json['available'] != null
          ? double.tryParse(json['available'].toString())
          : null,
      owed: json['owed'] != null
          ? double.tryParse(json['owed'].toString())
          : null,
    );
  }
}
