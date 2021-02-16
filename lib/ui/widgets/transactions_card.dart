part of 'widgets.dart';

class TransactionsCard1 extends StatelessWidget {
  final Transactions transactions;

  TransactionsCard1({this.transactions});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 16, bottom: 10),
          width: 70,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: transactions.picture != null
                      ? NetworkImage(
                          imageBaseUrl + "w500" + transactions.picture)
                      : AssetImage("assets/bg_topup.png"))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              transactions.title,
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              NumberFormat.currency(
                      locale: "id_ID", decimalDigits: 0, symbol: "Rp. ")
                  .format(transactions.amount < 0
                      ? -transactions.amount
                      : transactions.amount),
              style: blackTextFont.copyWith(
                  color: transactions.amount < 0 ? Colors.pink : Colors.green),
            ),
            Text(
              transactions.subtitle,
              style: blackTextFont,
            )
          ],
        )
      ],
    );
  }
}
