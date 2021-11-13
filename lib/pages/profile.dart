import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {
  Profile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Profile'.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                      fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1611451444023-7fe9d86fe1d0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXQlMjB3b21hbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                    radius: 60.0,
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                "Mazen Omar",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/2454973/screenshots/15252531/media/72e9aaee287285943dd60cc3075a59e8.jpg?compress=1&resize=400x300'),
                    radius: 32.0,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/2454973/screenshots/15252531/media/72e9aaee287285943dd60cc3075a59e8.jpg?compress=1&resize=400x300'),
                    radius: 32.0,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/2454973/screenshots/15252531/media/72e9aaee287285943dd60cc3075a59e8.jpg?compress=1&resize=400x300'),
                    radius: 32.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Goals Met"),
                  Text("Excerise Time"),
                  Text("Health Points"),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Next Goals',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.grey[400]),
              ),
              GoalDetail(screenWidth: screenWidth),
              GoalDetail(screenWidth: screenWidth),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalDetail extends StatelessWidget {
  const GoalDetail({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30.0,
                width: screenWidth/3,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.dumbbell,color: Colors.white,size: 15.0,),
                    SizedBox(width: 15.0,),
                    Text("Activites", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
