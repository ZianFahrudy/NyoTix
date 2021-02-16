part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: defaultmargin, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToMainPage());
                      },
                      child: Icon(Icons.arrow_back)),
                ),
              ),
              BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                UserModels user = (userState as UserLoaded).user;
                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: user.profilePicture == ""
                                  ? AssetImage("assets/user_pic.png")
                                  : NetworkImage(user.profilePicture))),
                    ),
                    Text(user.name,
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Text(user.email,
                        style: greyTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: defaultmargin, vertical: 12),
                      child: Row(children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 30,
                            width: 30,
                            child: Image.asset("assets/edit_profile.png")),
                        GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToEditProfilePage(
                                (userState as UserLoaded).user));
                          },
                          child: Text("Edit Profile",
                              style: blackTextFont.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ),
                      ]),
                    ),
                  ],
                );
              }),
              generateTitik((MediaQuery.of(context).size.width)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultmargin, vertical: 12),
                child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/my_wallet.png")),
                  Text("My Wallet",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ]),
              ),
              generateTitik((MediaQuery.of(context).size.width)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultmargin, vertical: 12),
                child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/language.png")),
                  Text("Change Language",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ]),
              ),
              generateTitik((MediaQuery.of(context).size.width)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultmargin, vertical: 12),
                child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/help_centre.png")),
                  Text("Help Centre",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ]),
              ),
              generateTitik((MediaQuery.of(context).size.width)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultmargin, vertical: 12),
                child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/rate.png")),
                  Text("Rate Apps",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ]),
              ),
              generateTitik((MediaQuery.of(context).size.width)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultmargin, vertical: 12),
                child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 30,
                      child: Icon(MdiIcons.logout)),
                  GestureDetector(
                    onTap: () async {
                      context.bloc<UserBloc>().add(SignOutUser());
                      await AuthServices.signOut();
                    },
                    child: Text("Log Out",
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
