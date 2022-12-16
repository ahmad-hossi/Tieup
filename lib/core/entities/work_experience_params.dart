class WorkExperienceParams {
  final String jobTitle;
  final String companyName;
  final String description;
  final String subDomainId;
  final String startDate;
  final String? endDate;

  WorkExperienceParams(
      {required this.jobTitle,
      required this.companyName,
      required this.description,
      required this.subDomainId,
      required this.startDate,
      this.endDate});

  Map<String, dynamic> toJson() {
    return {
      'sub_domain_id': subDomainId,
      'jop_title': jobTitle,
      'company': companyName,
      'description': description,
      'start_date': startDate,
      'end_date': endDate
    };
  }
}
