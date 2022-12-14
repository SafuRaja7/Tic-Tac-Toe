import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppUtils {
  static var darkFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(
      color: Colors.black,
      letterSpacing: 3,
    ),
  );
  static var lightFont = GoogleFonts.pressStart2p(
    textStyle:
        const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 25),
  );
}
