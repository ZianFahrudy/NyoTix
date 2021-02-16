part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class GoToMovieDetailPage extends PageEvent {
  final Movie movie;

  GoToMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetails movieDetails;

  GoToSelectSchedulePage(this.movieDetails);
  @override
  List<Object> get props => [movieDetails];
}

class GoToSelectSeatsPage extends PageEvent {
  final Tickets tickets;
  GoToSelectSeatsPage(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class GoToCheckOutPage extends PageEvent {
  final Tickets tickets;

  GoToCheckOutPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class GoToSuccessPage extends PageEvent {
  final Tickets tickets;
  final Transactions transactions;

  GoToSuccessPage(this.tickets, this.transactions);
  @override
  List<Object> get props => [tickets, transactions];
}

class GoToTicketDetailPage extends PageEvent {
  final Tickets tickets;
  GoToTicketDetailPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class GoToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTopUpPage extends PageEvent {
  final PageEvent pageEvent;

  GoToTopUpPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];
}

class GoToWalletPage extends PageEvent {
  final PageEvent pageEvent;
  GoToWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class GoToEditProfilePage extends PageEvent {
  final UserModels userModels;

  GoToEditProfilePage(this.userModels);
  @override
  List<Object> get props => [userModels];
}
