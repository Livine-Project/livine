import 'package:flutter/material.dart';


class Grocery extends StatefulWidget {
  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> 
 with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[800],
        title: Text('Groceries'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left:20.0),
        children: <Widget>[
          SizedBox(height: 15.0,),
          Text("Categories", style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right:45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [

            ],
          ),

        ],
      ),

    );
  }
}
