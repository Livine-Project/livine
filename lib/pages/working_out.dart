
import 'package:flutter/material.dart';


class WorkingOut extends StatefulWidget {
  @override
  _WorkingOutState createState() => _WorkingOutState();
}

class _WorkingOutState extends State<WorkingOut> {
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: (theme.getTheme() == ThemeData.dark()) ? Colors
        //     .grey[900] : Colors.blue[800],
        title: Text('Working Out'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, '/settings')),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                  image: AssetImage('images/working_out.gif'),
                width: 200.0,
              ),
            ),
            Container(
              child: Text("10 min workout for each per day"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
              margin: EdgeInsets.only(
                bottom: 5.0,
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.0,
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xFFD9D9D9),
                        backgroundImage: NetworkImage(
                            'https://cdn.dribbble.com/users/1532610/screenshots/3906806/___.gif'),
                        radius: 36.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Push up',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),

                        ],

                      ),

                    ],

                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
              margin: EdgeInsets.only(
                bottom: 5.0,
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.0,
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xFFD9D9D9),
                        backgroundImage: NetworkImage(
                            'https://hips.hearstapps.com/ame-prod-menshealth-assets.s3.amazonaws.com/main/assets/bodyweight-squat.gif?resize=480:*'),
                        radius: 36.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Standard Squat',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),

                        ],

                      ),

                    ],

                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
              margin: EdgeInsets.only(
                bottom: 5.0,
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.0,
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xFFD9D9D9),
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/34/cb/99/34cb992c8c0c57e896a22c1036a7c038.gif'),
                        radius: 36.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Jumping Jacks',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),

                        ],

                      ),

                    ],

                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
              margin: EdgeInsets.only(
                bottom: 5.0,
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.0,
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xFFD9D9D9),
                        backgroundImage: NetworkImage(
                            'https://media1.tenor.com/images/25f33bf7a836e92d9ac08cd7cef017c2/tenor.gif?itemid=16591507'),
                        radius: 36.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Hip Bridge',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),

                        ],

                      ),

                    ],

                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
              margin: EdgeInsets.only(
                bottom: 5.0,
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.0,
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xFFD9D9D9),
                        backgroundImage: NetworkImage(
                            'https://media0.giphy.com/media/2UqZvQq4p9DjTBDVRc/giphy.gif'),
                        radius: 36.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Plank',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),

                        ],

                      ),

                    ],

                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}