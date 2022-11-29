
class ProfileModel{
  ProfileModel({
    required this.id,
    required this.profileImage,
    required this.profileName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.creationTime
  });

  final String? id;
  final String? phoneNumber;
  final String? profileImage;
  final String? profileName;
  final String? email;
  final String? address;
  final DateTime? creationTime;


  factory ProfileModel.fromJson(Map<String, dynamic> profile) {
    return ProfileModel(
      email: profile['personal_information']["email"],
      profileName: profile['personal_information']["full_name"],
      // fcmToken: profile['personal_information']["fcm_token"],
      phoneNumber: profile['personal_information']["phone_number"],
      profileImage: profile["profile_picture"]["image"],
      id: '',
      address: profile['personal_information']['address'],
      );
  }
}
