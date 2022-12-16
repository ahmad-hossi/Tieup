import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  final int id;
  final String jobTitle;
  final String companyName;
  final String description;
  final int subDomainId;
  final String subDomainName;
  final String startDate;
  final String? endDate;

  const Experience(
      {required this.id,
      required this.jobTitle,
      required this.companyName,
      required this.description,
      required this.subDomainId,
      required this.subDomainName,
      required this.startDate,
      this.endDate});

  @override
  List<Object?> get props => [id];
}
