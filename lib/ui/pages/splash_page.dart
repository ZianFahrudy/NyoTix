part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultmargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 136,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/logo.png'))),
              ),
              Container(
                margin: EdgeInsets.only(top: 87, bottom: 16),
                child: Text(
                  "New Experience",
                  style: blackTextFont.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "Watch a new movie much\n easier than any berfore",
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 53, bottom: 20),
                width: 250,
                height: 45,
                child: RaisedButton(
                    child: Text(
                      "Get Started",
                      style: whiteTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    onPressed: () {
                      context
                          .bloc<PageBloc>()
                          .add(GoToRegistrationPage(RegistrationData()));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: greyTextFont.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToLoginPage());
                    },
                    child: Text(
                      " Sign In",
                      style: purpleTextFont.copyWith(fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
