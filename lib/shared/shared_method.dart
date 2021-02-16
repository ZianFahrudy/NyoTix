part of 'shared.dart';

Future<File> getImage() async {
  PickedFile pickedFile =
      await ImagePicker().getImage(source: ImageSource.gallery);

  File file = File(pickedFile.path);
  return file;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);

  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}

Widget generateTitik(double width) {
  int n = (width / 5).truncate();
  return Row(
    children: List.generate(
        n,
        (index) => (index % 2 == 0)
            ? Container(
                height: 2,
                color: Colors.grey,
                width: width / n,
              )
            : SizedBox(
                width: width / n,
              )),
  );
}
