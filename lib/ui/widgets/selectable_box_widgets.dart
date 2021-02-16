part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final bool isEnabled;
  final bool isSelected;
  final Function onTap;
  final TextStyle textStyle;

  SelectableBox(this.text,
      {this.isEnabled = true,
      this.isSelected = false,
      this.width = 144,
      this.height = 60,
      this.onTap,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
              color: (!isEnabled)
                  ? Color(0xFFE4E4E4)
                  : isSelected ? Colors.transparent : Color(0xFFE4E4E4)),
          color: (!isEnabled)
              ? Color(0xFFE4E4E4)
              : isSelected ? accentColor2 : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text ?? "None",
            style: textStyle ??
                blackTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
