part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User userCredential = Provider.of<User>(context);
    if (userCredential == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(userCredential.uid));
        context.bloc<TicketBloc>().add(GetTickets(userCredential.uid));
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailPage(pageState.movie)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(pageState.movieDetails)
                                    : (pageState is OnSelectSeatsPage)
                                        ? SelectSeatsPage(pageState.tickets)
                                        : (pageState is OnCheckOutPage)
                                            ? CheckOutPage(pageState.tickets)
                                            : (pageState is OnSuccessPage)
                                                ? SuccessPage(pageState.tickets,
                                                    pageState.transactions)
                                                : (pageState
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.tickets)
                                                    : (pageState is OnProfilePage)
                                                        ? ProfilePage()
                                                        : (pageState
                                                                is OnTopUpPage)
                                                            ? TopUpPage(
                                                                pageState
                                                                    .pageEvent)
                                                            : (pageState
                                                                    is OnWalletPage)
                                                                ? WalletPage(
                                                                    pageState
                                                                        .pageEvent)
                                                                : (pageState
                                                                        is OnEditProfilePage)
                                                                    ? EditProfilePage(
                                                                        pageState.userModels)
                                                                    : MainPage());
  }
}
