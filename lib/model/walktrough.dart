import 'package:intransporia/cores/cores.dart';

class Walktrough {
  final String image;
  final String title;

  const Walktrough(this.image, this.title);

  static List<Walktrough> walktroughs = [
    const Walktrough(IntransporiaImages.walktrough1,
        'Laporkan kejadian-kejadian di sekitarmu!'),
    const Walktrough(IntransporiaImages.walktrough2,
        'Pesan dan ambil makanan langsung dari aplikasi.'),
  ];
}
