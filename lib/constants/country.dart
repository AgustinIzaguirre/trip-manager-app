
import 'package:flag/flag.dart';

enum Country {
  spain(
    "Spain",
    FlagsCode.ES,
  ),
  italy(
    "Italy",
    FlagsCode.IT,
  ),
  england(
    "England",
    FlagsCode.GB,
  ),
  switzerland(
    "Switzerland",
    FlagsCode.CH,
  ),
  netherlands(
    "Netherlands",
    FlagsCode.NL,
  ),
  portugal(
    "Portugal",
    FlagsCode.PT,
  ),
  france(
    "France",
    FlagsCode.FR,
  ),
  scotland(
    "Scotland",
    FlagsCode.GB,
  );

  const Country(this.name, this.flagsCode);
  final String name;
  final FlagsCode flagsCode;
}
