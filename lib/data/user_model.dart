class UserModel {
  final String name;
  final String email;
  final String image;
  final String phoneNumber;
  final String address;
  final String city;

  UserModel(
      {required this.address,
      required this.city,
      required this.email,
      required this.image,
      required this.name,
      required this.phoneNumber});
}
