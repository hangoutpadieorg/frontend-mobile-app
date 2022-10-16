
class ProfileModel{
  ProfileModel({
    required this.id,
    required this.profileImage,
    required this.profileName,
    required this.email,
    required this.phoneNumber,
    required this.address});
  final int id;
  final String phoneNumber;
  final String profileImage;
  final String profileName;
  final String email;
  final String address;
}