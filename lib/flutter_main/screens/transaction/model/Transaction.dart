class Transaction {
  Transaction({
    this.id,
    this.createdDate,
    this.transactionStatus,
    this.categoriesNames,
    this.addressName,
    this.paymentName,
    this.totalPrice,
  });

  int id;
  DateTime createdDate;
  String transactionStatus;
  List<CategoriesName> categoriesNames;
  String addressName;
  String paymentName;
  int totalPrice;
}

enum CategoriesName { EMPTY, CATEGORIES_NAME, PURPLE }
