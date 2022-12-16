class SignUpParams {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpParams(
      {required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.password});

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'type': 'user',
      };
}
