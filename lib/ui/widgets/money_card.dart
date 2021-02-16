part of 'widgets.dart';

class MoneyCard extends StatelessWidget {
  final int amount;

  final double width;
  final bool isSelected;
  final Function onTap;

  MoneyCard({this.amount, this.width, this.isSelected = false, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? accentColor2 : Colors.white,
              border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          height: 60,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("IDR"),
              Text(NumberFormat.currency(
                      locale: "id_ID", decimalDigits: 0, symbol: "")
                  .format(amount))
            ],
          ),
        ));
  }
}
