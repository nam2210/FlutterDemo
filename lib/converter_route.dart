import 'package:flutter/material.dart';
import 'package:hello_nam/unit.dart';
import 'package:meta/meta.dart';

class ConverterRoute extends StatefulWidget {
  final String name;
  final Color color;
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute(
      {@required this.name, @required this.color, @required this.units})
      : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  State<StatefulWidget> createState() {
    return _ConverterRouteState();
  }
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  TextEditingController fahController;
  TextEditingController celController;
  bool _validate = false;
  bool _fahValidate = false;

  // TODO: Determine whether you need to override anything, such as initState()
  @override
  void initState() {
    super.initState();
    fahController = new TextEditingController();
    celController = new TextEditingController();
  }

  // TODO: Add other helper functions. We've given you one, _format()
  double _formatToF(double c) {
    return (c * (9 / 5)) + 32;
  }

  double _formatToC(double f) {
    return (f - 32) * 5 / 9;
  }

  bool _checkItNumber(String text) {
    return RegExp(r"^[0-9.]+$").hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that
    // includes the input value, and 'from' unit [Dropdown].
    Widget inputWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headline,
          decoration: InputDecoration(
            labelText: 'Celsius',
            labelStyle: Theme.of(context).textTheme.headline,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            errorText: _validate ? 'Error input' : null,
          ),
          onChanged: (value) {
            print("First text field: $value");
            setState(() {
              if (value.isEmpty) {
                _validate = false;
                fahController.text = '';
              } else {
                //check here
                try {
                  _validate = false;
                  fahController.text =
                      _formatToF(double.parse(value)).toString();
                } catch (e) {
                  _validate = true;
                }
              }
            });
          },
          controller: celController,
        )
      ],
    );

    // TODO: Create a compare arrows icon.
    Icon arrowIcon = Icon(Icons.import_export);

    // TODO: Create the 'output' group of widgets. This is a Column that
    // includes the output value, and 'to' unit [Dropdown].
    Widget outputWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          controller: fahController,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.headline,
          decoration: InputDecoration(
            labelText: 'Fahrenheit',
            labelStyle: Theme.of(context).textTheme.headline,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            errorText: _fahValidate ? "Error input" : null
          ),
          onChanged: (value) {
            print("second text field: $value");
            setState(() {
              if (value.isEmpty) {
                _fahValidate = false;
                celController.text = '';
              } else {
                try {
                  _fahValidate = false;
                  celController.text =
                      _formatToC(double.parse(value)).toString();
                } catch (e) {
                  _fahValidate = true;
                }
              }
            });
          },
        )
      ],
    );

    // TODO: Return the input, arrows, and output widgets, wrapped in a Column.
    Padding convertWidget = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          inputWidget,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: arrowIcon,
          ),
          outputWidget
        ],
      ),
    );

    return convertWidget;
  }
}
