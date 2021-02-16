part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: mainColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      promo.title,
                      style: whiteTextFont.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      promo.subtitle,
                      style: greyTextFont.copyWith(
                          fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Text("OFF ${promo.discount}%",
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: accentColor2))
              ],
            ),
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (rect) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black.withOpacity(0.1), Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, 78, 80));
          },
          child: SizedBox(
            height: 80,
            width: 78,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.asset("assets/reflection2.png")),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (rect) {
              return LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.1)
                  ]).createShader(Rect.fromLTRB(0, 0, 45, 80));
            },
            child: SizedBox(
              height: 45,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(15)),
                  child: Image.asset("assets/reflection1.png")),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (rect) {
              return LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.1)
                  ]).createShader(Rect.fromLTRB(0, 0, 45, 80));
            },
            child: SizedBox(
              height: 45,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(15)),
                  child: Image.asset("assets/reflection3.png")),
            ),
          ),
        )
      ],
    );
  }
}
