class UpdateModel {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? birthday;
  int? gender;
  String? lastLoginDate;
  int? loginCount;
  int? statusId;
  int? brandId;
  String? brand;
  String? email;
  String? password;
  String? phoneNumber;
  String? role;
  int? points;
  int? nearestPoints;
  String? oldPassword;

  UpdateModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.birthday,
    this.gender,
    this.lastLoginDate,
    this.loginCount,
    this.statusId,
    this.brandId,
    this.brand,
    this.email,
    this.password,
    this.phoneNumber,
    this.role,
    this.points,
    this.nearestPoints,
    this.oldPassword,
  });

  UpdateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    birthday = json['birthday'];
    gender = json['gender'];
    lastLoginDate = json['lastLoginDate'];
    loginCount = json['loginCount'];
    statusId = json['statusId'];
    brandId = json['brandId'];
    brand = json['brand'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    points = json['points'];
    nearestPoints = json['nearestPoints'];
    oldPassword = json['oldPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['lastLoginDate'] = this.lastLoginDate;
    data['loginCount'] = this.loginCount;
    data['statusId'] = this.statusId;
    data['brandId'] = this.brandId;
    data['brand'] = this.brand;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['role'] = this.role;
    data['points'] = this.points;
    data['nearestPoints'] = this.nearestPoints;
    data['oldPassword'] = this.oldPassword;
    return data;
  }
}
