
import 'package:sync_app/app/modules/redeem_points_screen/data/model/reward_image_model.dart';

class RewardsData {
  int? id;
  int? statusId;
  int? brandId;
  int? settingId;
  String? name;
  int? pointsCount;
  int? viewCount;
  String? startDate;
  String? expiryDate;
  String? description;
  int? productId;
  String? product;
  String? imageUrl;
  List<Gallery>? gallery;

  RewardsData(
      {this.id,
      this.statusId,
      this.brandId,
      this.settingId,
      this.name,
      this.pointsCount,
      this.viewCount,
      this.startDate,
      this.expiryDate,
      this.description,
      this.productId,
      this.product,
      this.gallery,
      this.imageUrl});

  RewardsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['statusId'];
    brandId = json['brandId'];
    settingId = json['settingId'];
    name = json['name'];
    pointsCount = json['pointsCount'];
    viewCount = json['viewCount'];
    startDate = json['startDate'];
    expiryDate = json['expiryDate'];
    description = json['description'];
    productId = json['productId'];
    product = json['product'];
    imageUrl = json['imageUrl'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statusId'] = this.statusId;
    data['brandId'] = this.brandId;
    data['settingId'] = this.settingId;
    data['name'] = this.name;
    data['pointsCount'] = this.pointsCount;
    data['viewCount'] = this.viewCount;
    data['startDate'] = this.startDate;
    data['expiryDate'] = this.expiryDate;
    data['description'] = this.description;
    data['productId'] = this.productId;
    data['product'] = this.product;
    data['imageUrl'] = this.imageUrl;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
