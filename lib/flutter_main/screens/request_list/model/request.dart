class Transaction {
  int _technicianTransactionId;
  String _assigneeDate;
  String _customerName;
  String _customerPhone;
  String _customerSecondPhone;
  dynamic _customerImageUrl;
  String _transactionAddress;
  String _technicianStatus;
  String _categoryUrl;
  String _transactionDate;
  dynamic _confirmedDate;
  dynamic _startDate;
  dynamic _endDate;
  dynamic _ratingNumber;
  bool _cancelButtonActive;
  bool _startButtonActive;

  int get technicianTransactionId => _technicianTransactionId;

  String get assigneeDate => _assigneeDate;

  String get customerName => _customerName;

  String get customerPhone => _customerPhone;

  String get customerSecondPhone => _customerSecondPhone;

  dynamic get customerImageUrl => _customerImageUrl;

  String get transactionAddress => _transactionAddress;

  String get technicianStatus => _technicianStatus;

  String get categoryUrl => _categoryUrl;

  String get transactionDate => _transactionDate;

  dynamic get confirmedDate => _confirmedDate;

  dynamic get startDate => _startDate;

  dynamic get endDate => _endDate;

  dynamic get ratingNumber => _ratingNumber;

  bool get cancelButtonActive => _cancelButtonActive;

  bool get startButtonActive => _startButtonActive;

  Transaction(
      {int technicianTransactionId,
      String assigneeDate,
      String customerName,
      String customerPhone,
      String customerSecondPhone,
      dynamic customerImageUrl,
      String transactionAddress,
      String technicianStatus,
      String categoryUrl,
      String transactionDate,
      dynamic confirmedDate,
      dynamic startDate,
      dynamic endDate,
      dynamic ratingNumber,
      bool cancelButtonActive,
      bool startButtonActive}) {
    _technicianTransactionId = technicianTransactionId;
    _assigneeDate = assigneeDate;
    _customerName = customerName;
    _customerPhone = customerPhone;
    _customerSecondPhone = customerSecondPhone;
    _customerImageUrl = customerImageUrl;
    _transactionAddress = transactionAddress;
    _technicianStatus = technicianStatus;
    _categoryUrl = categoryUrl;
    _transactionDate = transactionDate;
    _confirmedDate = confirmedDate;
    _startDate = startDate;
    _endDate = endDate;
    _ratingNumber = ratingNumber;
    _cancelButtonActive = cancelButtonActive;
    _startButtonActive = startButtonActive;
  }

  Transaction.fromJson(dynamic json) {
    _technicianTransactionId = json["technicianTransactionId"];
    _assigneeDate = json["assigneeDate"];
    _customerName = json["customerName"];
    _customerPhone = json["customerPhone"];
    _customerSecondPhone = json["customerSecondPhone"];
    _customerImageUrl = json["customerImageUrl"];
    _transactionAddress = json["transactionAddress"];
    _technicianStatus = json["technicianStatus"];
    _categoryUrl = json["categoryUrl"];
    _transactionDate = json["transactionDate"];
    _confirmedDate = json["confirmedDate"];
    _startDate = json["startDate"];
    _endDate = json["endDate"];
    _ratingNumber = json["ratingNumber"];
    _cancelButtonActive = json["cancelButtonActive"];
    _startButtonActive = json["startButtonActive"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["technicianTransactionId"] = _technicianTransactionId;
    map["assigneeDate"] = _assigneeDate;
    map["customerName"] = _customerName;
    map["customerPhone"] = _customerPhone;
    map["customerSecondPhone"] = _customerSecondPhone;
    map["customerImageUrl"] = _customerImageUrl;
    map["transactionAddress"] = _transactionAddress;
    map["technicianStatus"] = _technicianStatus;
    map["categoryUrl"] = _categoryUrl;
    map["transactionDate"] = _transactionDate;
    map["confirmedDate"] = _confirmedDate;
    map["startDate"] = _startDate;
    map["endDate"] = _endDate;
    map["ratingNumber"] = _ratingNumber;
    map["cancelButtonActive"] = _cancelButtonActive;
    map["startButtonActive"] = _startButtonActive;
    return map;
  }
}
