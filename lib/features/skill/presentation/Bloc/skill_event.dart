part of 'skill_bloc.dart';

@immutable
abstract class SkillEvent {}

class GetDomainsEvent extends SkillEvent{}

class GetSubDomainsEvent extends SkillEvent{
  final int domainId;
  GetSubDomainsEvent({required this.domainId});
}

class GetSkillsEvent extends SkillEvent{
  final int subDomainId ;
  GetSkillsEvent({required this.subDomainId});
}

class GetUserSkillsEvent extends SkillEvent{}


