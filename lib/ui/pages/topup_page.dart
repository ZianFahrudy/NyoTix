part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;

  TopUpPage(this.pageEvent);
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  int selectedAmount = 0;
  TextEditingController amountController = TextEditingController(text: "IDR");

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultmargin - 40) / 3;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(widget.pageEvent);
        return;
      },
      child: Scaffold(
          body: ListView(
        children: <Widget>[
          SafeArea(
              child: Stack(children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, left: defaultmargin),
                child: Icon(Icons.arrow_back)),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Top Up",
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
          ])),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultmargin),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (text) {
                    String temp = '';

                    for (var i = 0; i < text.length; i++) {
                      temp += text.isDigit(i) ? text[i] : "";
                    }

                    setState(() {
                      selectedAmount = int.tryParse(temp);
                    });

                    amountController.text = NumberFormat.currency(
                            locale: "id_ID", decimalDigits: 0, symbol: "IDR ")
                        .format(selectedAmount);

                    amountController.selection = TextSelection.fromPosition(
                        TextPosition(offset: amountController.text.length));
                  },
                  controller: amountController,
                  decoration: InputDecoration(
                      labelStyle: greyTextFont,
                      labelText: "Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Choose by template",
                      style: blackTextFont.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 14),
                Wrap(
                  spacing: 20,
                  runSpacing: 14,
                  children: <Widget>[
                    makeMoneyCard(amount: 50000, width: cardWidth),
                    makeMoneyCard(amount: 100000, width: cardWidth),
                    makeMoneyCard(amount: 200000, width: cardWidth),
                    makeMoneyCard(amount: 250000, width: cardWidth),
                    makeMoneyCard(amount: 500000, width: cardWidth),
                    makeMoneyCard(amount: 1500000, width: cardWidth),
                    makeMoneyCard(amount: 2000000, width: cardWidth),
                    makeMoneyCard(amount: 2500000, width: cardWidth),
                    makeMoneyCard(amount: 5000000, width: cardWidth),
                  ],
                ),
                SizedBox(height: 100),
                BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => Container(
                        height: 45,
                        width: 250,
                        child: RaisedButton(
                            child: Text("Top Up Now",
                                style: whiteTextFont.copyWith()),
                            elevation: 0,
                            color: selectedAmount > 0
                                ? Color(0xFF3E9D9D)
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: selectedAmount > 0
                                ? () {
                                    context.bloc<PageBloc>().add(GoToSuccessPage(
                                        null,
                                        Transactions(
                                            userID: (userState as UserLoaded)
                                                .user
                                                .id,
                                            amount: selectedAmount,
                                            title: "Top Up My Wallet",
                                            subtitle:
                                                "${DateTime.now().dayName}, ${DateTime.now().day} ${DateTime.now().monthName} ${DateTime.now().year}",
                                            time: DateTime.now())));
                                  }
                                : null)))
              ],
            ),
          ),
        ],
      )),
    );
  }

  MoneyCard makeMoneyCard({double width, int amount}) {
    return MoneyCard(
      amount: amount,
      width: width,
      isSelected: amount == selectedAmount,
      onTap: () {
        setState(() {
          if (selectedAmount != amount) {
            selectedAmount = amount;
          } else {
            selectedAmount = 0;
          }

          amountController.text = NumberFormat.currency(
                  locale: "id_ID", decimalDigits: 0, symbol: "IDR ")
              .format(selectedAmount);
          amountController.selection = TextSelection.fromPosition(
              TextPosition(offset: amountController.text.length));
        });
      },
    );
  }
}
