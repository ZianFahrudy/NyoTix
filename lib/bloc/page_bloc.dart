import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gotixx/models/models.dart';
import 'package:gotixx/models/movie.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToRegistrationPage) {
      yield OnRegistrationPage(event.registrationData);
    } else if (event is GoToPreferencePage) {
      yield OnPreferencePage(event.registrationData);
    } else if (event is GoToAccountConfirmationPage) {
      yield OnAccountConfirmationPage(event.registrationData);
    } else if (event is GoToMovieDetailPage) {
      yield OnMovieDetailPage(event.movie);
    } else if (event is GoToSelectSchedulePage) {
      yield OnSelectSchedulePage(event.movieDetails);
    } else if (event is GoToSelectSeatsPage) {
      yield OnSelectSeatsPage(event.tickets);
    } else if (event is GoToCheckOutPage) {
      yield OnCheckOutPage(event.tickets);
    } else if (event is GoToSuccessPage) {
      yield OnSuccessPage(event.tickets, event.transactions);
    } else if (event is GoToTicketDetailPage) {
      yield OnTicketDetailPage(event.tickets);
    } else if (event is GoToProfilePage) {
      yield OnProfilePage();
    } else if (event is GoToTopUpPage) {
      yield OnTopUpPage(event.pageEvent);
    } else if (event is GoToWalletPage) {
      yield OnWalletPage(event.pageEvent);
    } else if (event is GoToEditProfilePage) {
      yield OnEditProfilePage(event.userModels);
    }
  }
}
