

import 'package:sync_app/app/modules/redeem_points_screen/data/model/rewards_data_model.dart';

class RewardsModel {
  bool? success;
  List<RewardsData>? rewardsData;
  int? count;

  RewardsModel({this.success, this.rewardsData, this.count});

  RewardsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    // data = json['data'] != null ? new RewardsData.fromJson(json['data']) : null;
    if (json['data'] != null) {
      rewardsData = <RewardsData>[];
      json['data'].forEach((v) {
        rewardsData!.add(RewardsData.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.rewardsData != null) {
      data['data'] = this.rewardsData!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}
