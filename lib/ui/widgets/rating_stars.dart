part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final MainAxisAlignment alignment;

  RatingStars(
      {this.voteAverage = 0,
      this.alignment = MainAxisAlignment.center,
      this.starSize = 20,
      this.fontSize = 12});
  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).truncate();
    List<Widget> widgets = List.generate(
        5,
        (index) => (index <= n)
            ? Icon(
                MdiIcons.star,
                color: accentColor2,
                size: starSize,
              )
            : Icon(
                MdiIcons.starOutline,
                color: Colors.grey,
                size: starSize,
              ));

    widgets.add(SizedBox(
      width: 5,
    ));
    widgets.add(Text("$voteAverage/10",
        style:
            greyTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.w300)));

    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
