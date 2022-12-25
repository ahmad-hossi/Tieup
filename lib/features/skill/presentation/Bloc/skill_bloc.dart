import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/core/entities/params.dart';
import 'package:tieup/features/skill/domain/entities/domain.dart';
import 'package:tieup/features/skill/domain/entities/sub_domain.dart';
import 'package:tieup/features/skill/domain/use_cases/get_domains.dart';
import 'package:tieup/features/skill/domain/use_cases/get_skills.dart';
import 'package:tieup/features/skill/domain/use_cases/get_sub_domains.dart';

part 'skill_event.dart';
part 'skill_state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  GetDomains getDomains;
  GetSubDomains getSubDomains;
  GetSkills getSkills;

  SkillBloc(
      {required this.getDomains,
      required this.getSubDomains,
      required this.getSkills})
      : super(SkillInitial()) {
    on<GetDomainsEvent>((event, emit) async {
      emit(SkillLoading());
      final eitherResponse = await getDomains(NoParams());
      emit(eitherResponse.fold((failure) => SkillFailure(errorMessage: 'error'),
          (domains) => DomainsLoaded(domains: domains)));
    });

    on<GetSubDomainsEvent>((event, emit) async{
      final eitherResponse = await getSubDomains(Params(id: event.domainId));
      emit(eitherResponse.fold((failure) => SkillFailure(errorMessage: 'error'),
              (subDomains) => SubDomainsLoaded(subDomains: subDomains)));
    });

  }
}
