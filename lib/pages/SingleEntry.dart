import 'package:flutter/material.dart';
import 'package:ImpalaAdmin/widgets/CustomEntry.dart';
import 'package:ImpalaAdmin/widgets/Starrating.dart';

class SingleEntry extends StatefulWidget {
  SingleEntry({Key key}) : super(key: key);

  @override
  _SingleEntryState createState() => _SingleEntryState();
}

class _SingleEntryState extends State<SingleEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.grey[850],
          elevation: 7.0,
          title: new Text(
            "Add Individual Entry",
            style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        body: new Container(
          color: Colors.grey[850],
          child: new CustomScrollView(
            slivers: [
              new SliverToBoxAdapter(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text("Name",
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                        new SizedBox(height: 15.0),
                        new CustomEntry(
                          hint: "Name",
                          width: 300,
                        ),
                        new SizedBox(height: 25.0),
                      ],
                    ),
                    new Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text("Bewertung",
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                        new SizedBox(height: 15.0),
                        new Starrating(
                          rating: 4,
                        ),
                        new SizedBox(height: 25.0),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
