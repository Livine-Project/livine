
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BugReport extends StatefulWidget {
  const BugReport({Key? key}) : super(key: key);

  @override
  _BugReportState createState() => _BugReportState();
}

class _BugReportState extends State<BugReport> {

  Future<void> sendReport() async{
    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['wildlifemain1@gmail.com'],
    );
    await FlutterEmailSender.send(email);

  }



  // File _image;
  // Future getImageGallery() async{
  //   var permissionGallery = await Permission.photos.status;
  //   Permission.photos.request();
  //   if (await permissionGallery.isGranted) {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //         setState(() {
  //     _image = image as File;
  //   });

  //   }

  // }

  TextEditingController? _textcontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0,top:15.0),
            child: GestureDetector(
              onTap: sendReport,
              child: Text("Submit", style: TextStyle(
                fontSize: 19.0,

              ),),
            ),
          ),
        ],
        title: Text(
          "Report a bug",
          style: TextStyle(fontSize: 19.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('images/Settings/bugreport.svg',
            width: 350.0,
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textcontroller,
              maxLines: 7,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                hintText: "Briefly, specify the problem",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                  // ignore: use_full_hex_values_for_flutter_colors
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff3a0ca3)),
                  elevation: MaterialStateProperty.all(10.0),
                  fixedSize:
                      MaterialStateProperty.all<Size>(Size.fromWidth(120.0)),
                ),
                child: Text("Gallery"),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
