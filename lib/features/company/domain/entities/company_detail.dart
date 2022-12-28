class CompanyDetail{
  final int id;
  final String name;
  final String email;
  final String description;
  final String? profileImage;
  final String? coverImage;
  final String phone;
  final String location;
  final double longitude;
  final double latitude;
  final int cityId;
  final String city;

  CompanyDetail({
     required this.id,
     required this.name,
     required this.email,
     required this.description,
      this.profileImage,
      this.coverImage,
     required this.phone,
     required this.location,
     required this.longitude,
     required this.latitude,
     required this.cityId,
     required this.city});
}