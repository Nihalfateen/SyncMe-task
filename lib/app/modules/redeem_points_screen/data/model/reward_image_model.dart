class Gallery {
  int? id;
  int? rewardItemId;
  String? image;
  String? imageUrl;

  Gallery({this.id, this.rewardItemId, this.image, this.imageUrl});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rewardItemId = json['rewardItemId'];
    image = json['image'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rewardItemId'] = this.rewardItemId;
    data['image'] = this.image;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
