class RedeemPointsProductsModel {
  int? id;
  int? statusId;
  int? brandId;
  String? brand;
  int? settingId;
  String? title;
  int? buyedProductId;
  String? buyedProduct;
  int? rewardProductId;
  String? rewardProduct;
  String? empty;
  String? simiFilled;
  String? fullFilled;
  int? buyedCup;
  int? rewardCup;
  String? emptyUrl;
  String? simiFilledUrl;
  String? fullFilledUrl;

  RedeemPointsProductsModel({
    this.id,
    this.statusId,
    this.brandId,
    this.brand,
    this.settingId,
    this.title,
    this.buyedProductId,
    this.buyedProduct,
    this.rewardProductId,
    this.rewardProduct,
    this.empty,
    this.simiFilled,
    this.fullFilled,
    this.buyedCup,
    this.rewardCup,
    this.emptyUrl,
    this.simiFilledUrl,
    this.fullFilledUrl,
  });

  RedeemPointsProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['statusId'];
    brandId = json['brandId'];
    brand = json['brand'];
    settingId = json['settingId'];
    title = json['title'];
    buyedProductId = json['buyedProductId'];
    buyedProduct = json['buyedProduct'];
    rewardProductId = json['rewardProductId'];
    rewardProduct = json['rewardProduct'];
    empty = json['empty'];
    simiFilled = json['simiFilled'];
    fullFilled = json['fullFilled'];
    buyedCup = json['buyedCup'];
    rewardCup = json['rewardCup'];
    emptyUrl = json['emptyUrl'];
    simiFilledUrl = json['simiFilledUrl'];
    fullFilledUrl = json['fullFilledUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['statusId'] = this.statusId;
    data['brandId'] = this.brandId;
    data['brand'] = this.brand;
    data['settingId'] = this.settingId;
    data['title'] = this.title;
    data['buyedProductId'] = this.buyedProductId;
    data['buyedProduct'] = this.buyedProduct;
    data['rewardProductId'] = this.rewardProductId;
    data['rewardProduct'] = this.rewardProduct;
    data['empty'] = this.empty;
    data['simiFilled'] = this.simiFilled;
    data['fullFilled'] = this.fullFilled;
    data['buyedCup'] = this.buyedCup;
    data['rewardCup'] = this.rewardCup;
    data['emptyUrl'] = this.emptyUrl;
    data['simiFilledUrl'] = this.simiFilledUrl;
    data['fullFilledUrl'] = this.fullFilledUrl;

    return data;
  }
}
