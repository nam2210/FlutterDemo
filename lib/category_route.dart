// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hello_nam/catergory.dart';
import 'package:hello_nam/unit.dart';

final _backgroundColor = Colors.green[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _baseIcons = <IconData>[
    Icons.cake,
    Icons.add,
    Icons.home,
    Icons.access_alarms,
    Icons.accessibility_new,
    Icons.backspace,
    Icons.cached,
    Icons.search
  ];

  /// Makes the correct number of rows for the list view.
  ///
  /// For portrait, we use a [ListView].
  Widget _buildCategoryWidget(List<Widget> categories) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) => categories[index],
        itemCount: categories.length);
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String category){
    return List.generate(10, (int i){
      i += 1;
      return Unit(
        name: '$category Unit $i',
        conversion: i.toDouble()
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    final categories = <Category>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: _baseIcons[i],
          units: _retrieveUnitList(_categoryNames[i])));
    }

    final listView = Container(
        color: _backgroundColor,
        padding: EdgeInsets.all(8.0),
        child: _buildCategoryWidget(categories),
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: _backgroundColor,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
