import 'package:flutter/material.dart';
//DB Helper
import 'package:vaccinator2/services/db.dart';
//DB Tables
import 'package:vaccinator2/models/baby.dart';
import 'package:vaccinator2/models/caregiver.dart';
import 'package:vaccinator2/models/voucher.dart';
import 'package:vaccinator2/models/clinic.dart';
import 'package:vaccinator2/models/records.dart';
import 'package:vaccinator2/models/vaccine.dart';
//

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  static const String appTitle = "Vaccinator";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(title: const Text(appTitle!=null?appTitle:"title")),
          body: Home(),
        )
    );
  }
}

class Home extends StatelessWidget{
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(title: new Text(title!=null?title:"Milestone"),),
        body: new Milestone(),
        drawer: new Drawer(
            child: new ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: new Text("Profile"), //need to add stuff about caregiver here
                  decoration: new BoxDecoration(
                      color: Colors.lightBlue
                  ),
                ),
                new ListTile(
                    title: new Text("Milestones"),
                    onTap:(){
                      Navigator.pop(context);
                    }
                ),
                new ListTile(
                    title: new Text("Nearest Clinic"),
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Clinic()));
                    }
                ),
                new ListTile(
                    title: new Text("My Baby"),
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Baby()));
                    }
                ),
                new ListTile(
                    title: new Text("My tokens"),
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Tokens()));
                    }
                ),
                new ListTile(
                    title: new Text("My Vouchers"),
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Voucher()));
                    }
                )
              ],
            )
        )

    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Milestone $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class Milestone extends StatefulWidget {
  Milestone({Key key}) : super(key: key);

  @override
  _MilestoneState createState() => _MilestoneState();
}

class _MilestoneState extends State<Milestone> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue!=null?item.headerValue:"oops"),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue!=null?item.expandedValue:"oops"),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Clinic extends StatefulWidget{
  Clinic({Key key}) : super(key: key);

  @override
  _ClinicState createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
  List<Item> _data = generateItems(8);

  //List<Widget> get _clinic => _clinic.map((clinic) => format(clinic)).toList();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue != null ? item.headerValue : "oops"),
            );
          },
          body: ListTile(
              title: Text(
                  item.expandedValue != null ? item.expandedValue : "oops"),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Clinic2 extends StatelessWidget{
  final String appTitle = "Nearest Clinic";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(title: new Text(appTitle)),
      body: new Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.healing),
                        title: Text(""),
                        subtitle: Text('77 Down street, This Place')
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child:  Center(

                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                            leading: Icon(Icons.healing),
                            title: Text('Netcare Clinic'),
                            subtitle: Text('77 That street, Somewhere')
                        )
                      ],
                    ),
                  ),
                ),
              ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child:  Center(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                            leading: Icon(Icons.healing),
                            title: Text('Boulder Clinic'),
                            subtitle: Text('77 This street, Somewhere Else')
                        )
                      ],
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Baby extends StatelessWidget{
  final String appTitle = "My Baby";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(appTitle!=null?appTitle:"oops")),
      body: new Center(),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new AddBaby()));
          }
      ),
    );
  }
}

class Tokens extends StatelessWidget{
  final String appTitle = "My Tokens";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(appTitle)),
      body: new Center(),
    );
  }
}

class Voucher extends StatelessWidget{
  final String appTitle = "My Vouchers";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(appTitle)),
      body: new Center(),
    );
  }
}

class AddBaby extends StatelessWidget{
  final String appTitle = "New Baby";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(appTitle)),
      body: new Center(),
    );
  }
}