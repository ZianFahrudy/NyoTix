part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namelController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    namelController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor1)));
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSplashPage());
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
                        margin: EdgeInsets.only(top: 20, bottom: 22),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .bloc<PageBloc>()
                                      .add(GoToSplashPage());
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Create New\nYour Account",
                                textAlign: TextAlign.center,
                                style: blackTextFont.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //profile picture
                      Container(
                        height: 104,
                        width: 90,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (widget.registrationData
                                                  .profilePicture ==
                                              null)
                                          ? AssetImage("assets/user_pic.png")
                                          : FileImage(widget
                                              .registrationData.profilePicture),
                                      fit: BoxFit.cover)),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () async {
                                  if (widget.registrationData.profilePicture ==
                                      null) {
                                    widget.registrationData.profilePicture =
                                        await getImage();
                                  } else {
                                    widget.registrationData.profilePicture =
                                        null;
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: (widget.registrationData
                                                .profilePicture ==
                                            null)
                                        ? Image.asset(
                                            "assets/btn_add_photo.png")
                                        : Image.asset(
                                            "assets/btn_del_photo.png")),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextField(
                        controller: namelController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Full Name",
                          hintText: "Full Name",
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Email Address",
                          hintText: "Email Address",
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Password",
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Confirm Password",
                          hintText: "Confirm Password",
                        ),
                      ),
                      SizedBox(height: 30),
                      FloatingActionButton(
                          elevation: 0,
                          backgroundColor: mainColor,
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (!(namelController.text.trim() != "" &&
                                emailController.text.trim() != "" &&
                                passwordController.text.trim() != "" &&
                                confirmPasswordController.text.trim() != "")) {
                              Flushbar(
                                duration: Duration(milliseconds: 1500),
                                backgroundColor: Colors.pink,
                                flushbarPosition: FlushbarPosition.TOP,
                                message:
                                    "Tolong isi semua kolom terlebih dahulu",
                              ).show(context);
                            } else if (!(passwordController.text ==
                                confirmPasswordController.text)) {
                              Flushbar(
                                duration: Duration(milliseconds: 1500),
                                backgroundColor: Colors.pink,
                                flushbarPosition: FlushbarPosition.TOP,
                                message:
                                    "Password dan Confirm Password harus sama",
                              ).show(context);
                            } else if (!(EmailValidator.validate(
                                emailController.text))) {
                              Flushbar(
                                duration: Duration(milliseconds: 1500),
                                backgroundColor: Colors.pink,
                                flushbarPosition: FlushbarPosition.TOP,
                                message: "Format email harus bener",
                              ).show(context);
                            } else {
                              widget.registrationData.name =
                                  namelController.text;
                              widget.registrationData.email =
                                  emailController.text;
                              widget.registrationData.password =
                                  passwordController.text;

                              context.bloc<PageBloc>().add(
                                  GoToPreferencePage(widget.registrationData));
                            }
                          })
                    ],
                  ),
                ],
              ),
            )));
  }
}
