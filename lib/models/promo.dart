part of 'models.dart';

class Promo  {
  final String title;
  final String subtitle;
  final int discount;

  Promo({this.title, this.discount, this.subtitle});

 
}

List<Promo> dummyPromos = [
  Promo(
      title: "Students Holiday",
      subtitle: "Maximal only for two people",
      discount: 50),
  Promo(
      title: "Family Club",
      subtitle: "Maximal for three members",
      discount: 70),
  Promo(
      title: "Mahasiswa Amikom",
      subtitle: "Only for handsome people",
      discount: 50),
];
