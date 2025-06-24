class UserModel {
  final String uid;
  final String name;
  final double balance;

  UserModel({required this.uid, required this.name, required this.balance});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['client_name'],
      balance: double.parse(json['new_balance'].toString()),
    );
  }
}
