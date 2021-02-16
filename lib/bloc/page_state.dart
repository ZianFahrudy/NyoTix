part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;

  OnPreferencePage(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final Movie movie;

  OnMovieDetailPage(this.movie);

  @override
  List<Object> get props => [movie];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetails movieDetails;

  OnSelectSchedulePage(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

class OnSelectSeatsPage extends PageState {
  final Tickets tickets;
  OnSelectSeatsPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class OnCheckOutPage extends PageState {
  final Tickets tickets;

  OnCheckOutPage(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class OnSuccessPage extends PageState {
  final Tickets tickets;
  final Transactions transactions;

  OnSuccessPage(this.tickets, this.transactions);

  @override
  List<Object> get props => [tickets, transactions];
}

class OnTicketDetailPage extends PageState {
  final Tickets tickets;

  OnTicketDetailPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnTopUpPage extends PageState {
  final PageEvent pageEvent;

  OnTopUpPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];
}

class OnWalletPage extends PageState {
  final PageEvent pageEvent;

  OnWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class OnEditProfilePage extends PageState {
  final UserModels userModels;

  OnEditProfilePage(this.userModels);
    @override
  List<Object> get props => [userModels];
}
