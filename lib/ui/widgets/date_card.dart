part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double height;
  final double width;
  final DateTime dates;
  final Function onTap;

  DateCard(this.dates,
      {this.isSelected = false, this.height = 90, this.onTap, this.width = 70});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 90,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey),
            borderRadius: BorderRadius.circular(6),
            color: isSelected ? accentColor2 : Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(dates.shortDayName,
                style: blackTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 6,
            ),
            Text(
              dates.day.toString(),
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
