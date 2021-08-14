

//  class Diet extends StatefulWidget {
//   @override
//   _DietState createState() => _DietState();
// }
 
// class _DietState extends State<Diet> {
//   double caloriesValue = 0.75;
//   var caloriesPersentage;
 
//   @override
//   void initState() {
//     super.initState();
 
//     caloriesPersentage = caloriesValue * 100;
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     final theme = Provider.of<ThemeChanger>(context);
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Diet'),
//         backgroundColor: (theme.getTheme() == ThemeData.dark() ) ? Colors.grey[900] : Colors.blue[800],
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () => Navigator.pushNamed(context, '/settings'),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[

//             Row(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(left: 90.0),
//                   child: SizedBox(
//                     width: 125,
//                     height: 125,
//                     child: LiquidCircularProgressIndicator(
//                         backgroundColor: Colors.white,
//                         value: caloriesValue,
//                         valueColor: AlwaysStoppedAnimation(Colors.greenAccent[400]),
//                         borderColor: Colors.greenAccent,
//                         borderWidth: 0.1,
//                         direction: Axis.vertical,
//                         center: Text('''
//         $caloriesPersentage% 

//         1500
//                         ''',
                        
//                         ),
//                   ),
//                 ),
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   "Calories needed",
//                   style: TextStyle(color: Colors.greenAccent[400]),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Center(
//                   child: IconButton(
//                     icon: Icon(FontAwesomeIcons.calculator), 
//                     onPressed: () => Navigator.pushNamed(context, '/calories_calc'),
//                     iconSize: 40.0,
//                     color: Colors.greenAccent,
//                     splashColor: Colors.transparent,
//       ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 25.0),
//             Container(
//               margin: EdgeInsets.only(left:30.0, top: 10.0),
//               child: Text("Top advices"),
//               ),
//               Container(
//       padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//         top: 15.0,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1.0,
//               blurRadius: 6.0,
//             ),
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Color(0xFFD9D9D9),
//                 radius: 36.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 1.3,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Do not skip breakfast',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6.0,
//                   ),

//                 ],

//               ),

//             ],

//           ),
//         ],
//       ),
//     ),
//     Container(
//       padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1.0,
//               blurRadius: 6.0,
//             ),
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Color(0xFFD9D9D9),
//                 backgroundImage: NetworkImage(
//                     'https://nudefood.co.uk/wp-content/uploads/2018/05/pan-fried-fish-fillets-with-nicoise-salad-41303-1-1170x854.jpg'
//                     ),
//                 radius: 36.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 1.3,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Eat regular meals ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6.0,
//                   ),

//                 ],

//               ),

//             ],

//           ),
//         ],
//       ),
//     ),
// Container(
//       padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1.0,
//               blurRadius: 6.0,
//             ),
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Color(0xFFD9D9D9),
//                 backgroundImage: NetworkImage(
//                     'https://img.washingtonpost.com/rf/image_480w/2010-2019/WashingtonPost/2014/07/31/Production/Health/Images/bigstock-Green-And-Red-Healthy-Food-14588906.jpg?uuid=4A6TvhkGEeSeO38vEQxiZQ'),
//                 radius: 36.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 1.3,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Eat plenty of fruit and veg',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6.0,
//                   ),

//                 ],

//               ),

//             ],

//           ),
//         ],
//       ),
//     ),
// Container(
//       padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1.0,
//               blurRadius: 6.0,
//             ),
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Color(0xFFD9D9D9),
//                 backgroundImage: NetworkImage(
//                     'https://i.pinimg.com/originals/79/c7/ff/79c7ff9d622c8fae535a06898f0d6700.gif'),
//                 radius: 36.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 1.3,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Stay Hydrated ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6.0,
//                   ),

//                 ],

//               ),

//             ],

//           ),
//         ],
//       ),
//     ),
//     Container(
//       padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1.0,
//               blurRadius: 6.0,
//             ),
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Color(0xFFD9D9D9),
//                 backgroundImage: NetworkImage(
//                     'https://image.freepik.com/free-vector/people-running-activity_24908-55933.jpg'),
//                 radius: 36.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 1.3,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Get more active ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6.0,
//                   ),

//                 ],

//               ),

//             ],

//           ),
//         ],
//       ),
//     ),
// Container(
//       padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//       margin: EdgeInsets.only(
//         bottom: 20.0,
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1.0,
//               blurRadius: 6.0,
//             ),
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Color(0xFFD9D9D9),
//                 backgroundImage: NetworkImage(
//                     'https://buzznigeria.com/wp-content/uploads/2017/05/fast-food.jpg'),
//                 radius: 36.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 1.3,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Do not stock junk food',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6.0,
//                   ),

//                 ],

//               ),

//             ],

//           ),
//         ],
//       ),
//     ),
    

//           ],
//         ),
//       ),
//     );
//   }
// }