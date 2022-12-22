
class Job{
  final int id;
  final String jobTitle;
  final int minYearsRequirement;
  final int maxYearsRequirement;
  final double lowSalary;
  final double highSalary;
  final String cityName;
  final String subDomain;
  final int companyId;
  final String companyName;
  final String companyImgUrl;
  final String postedDate;

  Job({
     required this.id,
     required this.jobTitle,
     required this.minYearsRequirement,
     required this.maxYearsRequirement,
     required this.lowSalary,
     required this.highSalary,
     required this.cityName,
     required this.subDomain,
     required this.companyId,
     required this.companyName,
     required this.companyImgUrl,
     required this.postedDate});
}