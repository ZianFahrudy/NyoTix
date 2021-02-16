part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final UserModels userModels;

  EditProfilePage(this.userModels);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController;
  String profilePath;
  File profileFileImage;
  bool isUpdating = false;
  bool isDataEdited = false;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.userModels.name);
    profilePath = widget.userModels.profilePicture;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: accentColor1,
        ),
        SafeArea(child: Container(color: Colors.white)),
        ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultmargin),
              child: Column(children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Edit Your\nProfile",
                                textAlign: TextAlign.center,
                                style: blackTextFont.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)))),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                                onTap: () {
                                  context
                                      .bloc<PageBloc>()
                                      .add(GoToProfilePage());
                                },
                                child: Icon(Icons.arrow_back)))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 90,
                  height: 104,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: (profileFileImage != null)
                                    ? FileImage(profileFileImage)
                                    : (profilePath != "")
                                        ? NetworkImage(profilePath)
                                        : AssetImage("assets/user_pic.png")),
                            shape: BoxShape.circle,
                          )),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (profilePath == "") {
                                profileFileImage = await getImage();

                                if (profileFileImage == null) {
                                  profilePath = basename(profileFileImage.path);
                                }
                              } else {
                                profileFileImage = null;
                                profilePath = "";
                              }
                              setState(() {
                                isDataEdited = (nameController.text.trim() !=
                                            widget.userModels.name ||
                                        profilePath !=
                                            widget.userModels.profilePicture)
                                    ? true
                                    : false;
                              });
                            },
                            child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset((profilePath != "")
                                    ? "assets/btn_del_photo.png"
                                    : "assets/btn_add_photo.png")),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                AbsorbPointer(
                  child: TextField(
                    controller:
                        TextEditingController(text: widget.userModels.id),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(height: 12),
                AbsorbPointer(
                  child: TextField(
                    controller:
                        TextEditingController(text: widget.userModels.email),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: nameController,
                  onChanged: (text) {
                    setState(() {
                      isDataEdited = (text.trim() != widget.userModels.name ||
                              profilePath != widget.userModels.profilePicture)
                          ? true
                          : false;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(height: 10),
                Container(
                  height: 45,
                  width: 250,
                  child: RaisedButton(
                      color: Colors.red[400],
                      disabledColor: Color(0xFFE4E4E4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("Change Password",
                          style: whiteTextFont.copyWith()),
                      onPressed: isUpdating
                          ? null
                          : () async {
                              await AuthServices.resetPassword(
                                  widget.userModels.email);

                              Flushbar(
                                backgroundColor: Colors.pink,
                                message: "Link telah terkirim ke email kamu",
                                duration: Duration(seconds: 3),
                                flushbarPosition: FlushbarPosition.TOP,
                              )..show(context);
                            }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  width: 250,
                  child: RaisedButton(
                      disabledColor: Color(0xFFE4E4E4),
                      color: Color(0xFF3E9D9D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("Update My Profile",
                          style: whiteTextFont.copyWith()),
                      onPressed: (isDataEdited)
                          ? () async {
                              setState(() {
                                isUpdating = true;
                              });

                              if (profileFileImage != null) {
                                profilePath =
                                    await uploadImage(profileFileImage);
                              }

                              context.bloc<UserBloc>().add(UpdateDataUser(
                                    name: nameController.text,
                                    profilePicture: profilePath,
                                  ));

                              context.bloc<PageBloc>().add(GoToProfilePage());
                            }
                          : null),
                ),
              ]),
            ),
          ],
        )
      ],
    ));
  }
}
