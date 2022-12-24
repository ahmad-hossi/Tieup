import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tieup/core/entities/no_params.dart';
import 'package:tieup/features/portfolio/domain/use_cases/get_user_portfolio.dart';
import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';
import 'package:tieup/features/portfolio/domain/use_cases/update_user_portfolio.dart';
import 'package:tieup/core/constants/portfolio_params.dart';


part 'portfolio_event.dart';
part 'portfolio_state.dart';


class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetUserPortfolio getUserPortfolio;
  final UpdateUserPortfolio updateUserPortfolio;


  PortfolioBloc({required this.getUserPortfolio,
    required this.updateUserPortfolio}) : super(PortfolioInitial()) {
    on<GetUserPortfolioEvent>((event, emit) async{
      emit(PortfolioLoading());
      final eitherResponse = await getUserPortfolio(NoParams());
      emit(eitherResponse.fold((failure) => PortfolioFailed(errorMessage: 'errorMessage'),
              (userPortfolio) => PortfolioLoaded(userPortfolio: userPortfolio)));
    });

    on<UpdateUserPortfolioEvent>((event, emit) async{
      emit(PortfolioLoading());
      final eitherResponse = await updateUserPortfolio(PortfolioParams(event.userPortfolio));
      emit(eitherResponse.fold((failure) => PortfolioFailed(errorMessage: 'errorMessage'),
              (userPortfolio) => PortfolioLoaded(userPortfolio: userPortfolio)));

    });
  }
}

