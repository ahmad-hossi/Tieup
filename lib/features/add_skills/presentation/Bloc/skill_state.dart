part of 'skill_bloc.dart';

@immutable
abstract class SkillState {}

class SkillInitial extends SkillState {}

class SkillLoading extends SkillState {}

class SkillFailure extends SkillState {
  final String errorMessage;
  SkillFailure({required this.errorMessage});
}

class DomainsLoaded extends SkillState {
  final List<Domain> domains;
  DomainsLoaded({required this.domains});
}

class SubDomainsLoaded extends SkillState{
  final List<SubDomain> subDomains;
  SubDomainsLoaded({required this.subDomains});
}


