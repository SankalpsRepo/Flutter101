import 'package:flutter/material.dart';

// https://flutter.io/widgets/layout/
class SampleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

// Add the visible widget to the layout widget.
// All layout widgets have a child property if they take a single child (for example, Center or Container), 
// or a children property if they take a list of widgets (for example, Row, Column, ListView, or Stack).

// You can place the child of a row or column in an Expanded widget to control widget sizing along the main 
// axis. The Expanded widget has a flex property, an integer that determines the flex factor for a widget. 

// To fix the example in the previous section where the row of 3 images was too wide for its render box,
//  and resulted in the red strip, wrap each widget with an Expanded widget. 

// Use Stack to arrange widgets on top of a base widget—often an image.

    //Use a Container if you want to add padding(similar to div in HTML)
    // Container is a widget that allows you to customize its child widget. 
    //Use a Container when you want to add padding, margins, borders, or background color, to name some of its capabilities.
    Widget titleSection = Container(
      padding : const EdgeInsets.all(32.0),
      child : Row(
        children : [ 
          Expanded(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children : [ 
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                 'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ), 
    );  

    // Since the code for building each row would be almost identical,
    // it’s most efficient to create a nested function, such as buildButtonColumn()
    Column buildButtonColumn(IconData icon,String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child : Text(
              label,
              style :TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              )
            )
          )
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      // It’s easiest to use Scaffold, a widget from the Material Components library, which 
      // provides a default banner, background color, and has API for adding drawers, snack bars, and bottom sheets.
      home: Scaffold(
        body: ListView(
        children: [
          Image.asset(
            'images/lake.jpg',
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
        ),
      ),
    );
  }
}