class RedeemPointsModel {
  int? id;
  String? userId;
  String? cashierId;
  String? invoiceImage;
  String? invoiceImageBase64;
  String? orderNumber;
  String? transactionTime;
  String? note;
  int? amount;
  int? typeId;
  int? statusId;
  int? settingId;
  int? brandId;
  int? money;

  RedeemPointsModel(
      {this.id,
      this.userId,
      this.cashierId,
      this.invoiceImage,
      this.invoiceImageBase64,
      this.orderNumber,
      this.transactionTime,
      this.note,
      this.amount,
      this.typeId,
      this.statusId,
      this.settingId,
      this.brandId,
      this.money});

  RedeemPointsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    cashierId = json['cashierId'];
    invoiceImage = json['invoiceImage'];
    invoiceImageBase64 = json['invoiceImageBase64'];
    orderNumber = json['orderNumber'];
    transactionTime = json['transactionTime'];
    note = json['note'];
    amount = json['amount'];
    typeId = json['typeId'];
    statusId = json['statusId'];
    settingId = json['settingId'];
    brandId = json['brandId'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['cashierId'] = this.cashierId;
    data['invoiceImage'] = this.invoiceImage;
    data['invoiceImageBase64'] = this.invoiceImageBase64;
    data['orderNumber'] = this.orderNumber;
    data['transactionTime'] = this.transactionTime;
    data['note'] = this.note;
    data['amount'] = this.amount;
    data['typeId'] = this.typeId;
    data['statusId'] = this.statusId;
    data['settingId'] = this.settingId;
    data['brandId'] = this.brandId;
    data['money'] = this.money;
    return data;
  }
}
