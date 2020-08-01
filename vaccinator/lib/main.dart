import 'package:flutter/material.dart';

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
                  child: new Text("Profile"),
                  decoration: new BoxDecoration(
                      color: Colors.blue
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

class Clinic extends StatelessWidget{
  final String appTitle = "Nearest Clinic";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(appTitle)),
      body: new Center(),
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