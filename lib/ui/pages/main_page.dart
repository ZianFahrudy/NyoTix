part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

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
          color: Color(0xFFF6F7F9),
        )),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavbarIndex = index;
            });
          },
          children: <Widget>[
            MoviePage(),
            TicketPage(),
          ],
        ),
        createBottomNavbar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 42),
            width: 46,
            height: 46,
            child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Color(0xFFFBD460),
                onPressed: () async {
                  context.bloc<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
                },
                child: SizedBox(
                    width: 26,
                    height: 26,
                    child: Icon(
                      MdiIcons.walletPlus,
                      color: Colors.black.withOpacity(0.54),
                    ))),
          ),
        )
      ],
    ));
  }

  Widget createBottomNavbar() => Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavbarClipper(),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE0E0E0),
              elevation: 0,
              backgroundColor: Colors.transparent,
              currentIndex: bottomNavbarIndex,
              onTap: (index) {
                setState(() {
                  bottomNavbarIndex = index;

                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                    title: Text("New Movie",
                        style: GoogleFonts.raleway(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset(bottomNavbarIndex == 0
                          ? "assets/ic_movie.png"
                          : "assets/ic_movie_grey.png"),
                    )),
                BottomNavigationBarItem(
                    title: Text("My Ticket",
                        style: GoogleFonts.raleway(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset(bottomNavbarIndex == 1
                          ? "assets/ic_tickets.png"
                          : "assets/ic_tickets_grey.png"),
                    ))
              ]),
        ),
      ));
}

class BottomNavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
