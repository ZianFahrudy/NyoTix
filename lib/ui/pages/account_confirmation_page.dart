part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultmargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToPreferencePage(widget.registrationData));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm\nNew Account",
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                (widget.registrationData.profilePicture == null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(
                                        widget.registrationData.profilePicture),
                            fit: BoxFit.cover)),
                  ),
                  Text("Welcome",
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget.registrationData.name,
                      style: blackTextFont.copyWith(
                          fontSize: 25, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 100,
                  ),
                  (isSigningUp)
                      ? SpinKitFadingCircle(
                          color: Color(0xFF3E9D9D),
                          size: 45,
                        )
                      : Container(
                          width: 250,
                          height: 45,
                          child: RaisedButton(
                              child: Text(
                                "Create My Account",
                                style: whiteTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              color: Color(0xFF3E9D9D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () async {
                                setState(() {
                                  isSigningUp = true;
                                });

                                imageToUpload =
                                    widget.registrationData.profilePicture;

                             

                                SignInSignUpResult result =
                                    await AuthServices.signUp(
                                        widget.registrationData.email,
                                        widget.registrationData.password,
                                        widget.registrationData.name,
                                        widget.registrationData.selectedGenre,
                                        widget
                                            .registrationData.selectedLanguage);

                                if (result.userModels == null) {
                                  setState(() {
                                    isSigningUp = false;
                                  });

                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.pink,
                                    message: result.message,
                                  ).show(context);
                                }
                              }),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
