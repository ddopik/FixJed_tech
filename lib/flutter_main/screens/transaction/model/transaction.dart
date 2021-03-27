class Transaction {
  int _id;
  String _createdDate;
  String _transactionStatus;
  List<String> _categoriesNames;
  String _addressName;
  String _paymentName;
  int _totalPrice;

  int get id => _id;

  String get createdDate => _createdDate;

  String get transactionStatus => _transactionStatus;

  List<String> get categoriesNames => _categoriesNames;

  String get addressName => _addressName;

  String get paymentName => _paymentName;

  int get totalPrice => _totalPrice;

  Transaction(
      {int id,
      String createdDate,
      String transactionStatus,
      List<String> categoriesNames,
      String addressName,
      String paymentName,
      int totalPrice}) {
    _id = id;
    _createdDate = createdDate;
    _transactionStatus = transactionStatus;
    _categoriesNames = categoriesNames;
    _addressName = addressName;
    _paymentName = paymentName;
    _totalPrice = totalPrice;
  }

  Transaction.fromJson(dynamic json) {
    _id = json["id"];
    _createdDate = json["createdDate"];
    _transactionStatus = json["transactionStatus"];
    _categoriesNames = json["categoriesNames"] != null
        ? json["categoriesNames"].cast<String>()
        : [];
    _addressName = json["addressName"];
    _paymentName = json["paymentName"];
    _totalPrice = json["totalPrice"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["createdDate"] = _createdDate;
    map["transactionStatus"] = _transactionStatus;
    map["categoriesNames"] = _categoriesNames;
    map["addressName"] = _addressName;
    map["paymentName"] = _paymentName;
    map["totalPrice"] = _totalPrice;
    return map;
  }
}
