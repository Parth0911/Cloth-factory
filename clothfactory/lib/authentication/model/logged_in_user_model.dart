class LoginUsersModel {
  String? id;
  String? name;
  String? email;
  String? profilePicture;
  String? createdAt;
//  List<dynamic>? likedProduct;

  LoginUsersModel({
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.createdAt,
    // this.likedProduct
  });

  LoginUsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    createdAt = json['created_at'];
    // if (json['liked_product'] != null) {
    // likedProduct = <Null>[];
    //json['liked_product'].forEach((v) {
    //likedProduct!.add(new Null.fromJson(v));
    //});
    //}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profile_picture'] = profilePicture;
    data['created_at'] = createdAt;
    //  if (this.likedProduct != null) {
    //   data['liked_product'] =
    //       this.likedProduct!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
