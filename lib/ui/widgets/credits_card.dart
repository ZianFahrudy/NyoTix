part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final Credits credits;

  CreditCard(this.credits);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // cast crew
        Container(
          height: 80,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      imageBaseUrl + "w185" + (credits.profilePath ?? "")))),
        ),
        SizedBox(
          height: 6,
        ),
        SizedBox(
          width: 70,
          child: Text(
            credits.name,
            style: blackTextFont.copyWith(
                fontSize: 10, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
