import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hello_nam/unit.dart';


class ConverterRoute extends StatefulWidget{

  final String name;
  final Color color;
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units
}) : assert(name != null),
     assert(color != null),
     assert(units != null);

  @override
  State<StatefulWidget> createState() {
    return _ConverterRouteState();
  }
}

class _ConverterRouteState extends State<ConverterRoute>{

  @override
  Widget build(BuildContext context) {
    var unitWidgets = widget.units.map((Unit unit){
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: widget.color,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            )
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }

}

