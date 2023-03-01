import 'package:trip_manager/models/transport_type.dart';

class MeansOfTransport {
  final DateTime time;
  final String from;
  final String to;
  final TransportType type;

  MeansOfTransport._(this.time, this.from, this.to, this.type);

  static MeansOfTransport of(final DateTime time, final String from,
      final String to, final TransportType type) {
    return MeansOfTransport._(time, from, to, type);
  }
}
