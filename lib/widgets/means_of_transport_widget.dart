import 'package:flutter/material.dart';

import '../models/means_of_transport.dart';
import '../models/transport_type.dart';

class MeansOfTransportWidget extends StatelessWidget {
  final MeansOfTransport _meansOfTransport;
  final bool _isArrival;

  const MeansOfTransportWidget(this._meansOfTransport, this._isArrival,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final IconData transportIcon = _meansOfTransport.type == TransportType.plane
        ? Icons.flight
        : Icons.train;
    final Color borderColor = _isArrival
        ? Color.fromARGB(255, 166, 249, 169)
        : Color.fromARGB(255, 251, 172, 166);
    final DateTime transportTime = _meansOfTransport.time;
    final String dateFormatted =
        '${transportTime.day}/${transportTime.month}/${transportTime.year} - ${transportTime.hour}:${transportTime.minute}';
    return Card(
      color: borderColor,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
              child: Icon(
                transportIcon,
                size: 40,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
              child: Text(
                dateFormatted,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Column(
              children: [
                getTransportLocationText(_meansOfTransport.from),
                Icon(Icons.arrow_downward_rounded),
                getTransportLocationText(_meansOfTransport.to)
              ],
            )
          ],
        ),
      ),
    );
  }

  Text getTransportLocationText(final String locationName) {
    return Text(
      locationName,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
