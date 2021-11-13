
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget{
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  

    sendReport() async{
    final Email email = Email(
      body: '',
      subject: 'Bug Report | Livine',
      
      recipients: ['wildlifemain1@gmail.com'],
      isHTML: false,
    );
    String platformResponse;

    try {
      FlutterEmailSender.send(email).then((_){
        platformResponse = 'Thank you for sending your feedback , we will answer you soon....';

      });


    } catch (error) {
      platformResponse = error.toString();
    }

        ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
Future<bool> showWarning(BuildContext context) async =>showDialog(
  context: context, 
  builder: (context) =>AlertDialog(
      title: Text("Do you want to exit ?"),
      actions: [
        ElevatedButton(
        onPressed: ()=>Navigator.pop(context, false), 
        child: Text("No")),
        ElevatedButton(
        onPressed: ()=>Navigator.pop(context, true), 
        child: Text("Yes")),
      ],
      
    ));


  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final backPop = await showWarning(context);
        return backPop ?? false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(
                  child: Text(
                'Settings',
                style: GoogleFonts.bebasNeue(fontSize: 35.0),
              )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsGroup(text: 'General'),
                    SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SettingsTile(
                        text: 'Languages',
                        subtitle: 'English',
                        icon: Icons.language,
                        iconColor: Colors.white,
                        backgroundColor: Color(0xfff3F37C9),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SettingsGroup(text: 'Theme'),
                    SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/themeSettings'),
                      child: SettingsTile(
                        text: 'Theme',
                        subtitle: '',
                        icon: Icons.dark_mode,
                        iconColor: Colors.white,
                        backgroundColor: Colors.deepPurple[900],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SettingsGroup(text: 'Feedback'),
                    SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: sendReport,
                      child: SettingsTile(
                        text: 'Report a bug',
                        subtitle: '',
                        icon: Icons.bug_report,
                        iconColor: Colors.white,
                        backgroundColor: Colors.deepPurple[500],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
    
                                      SettingsGroup(text: 'Misc'),
                                                        SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/terms'),
                      child: SettingsTile(
                        text: 'Terms and conditions',
                        subtitle: '',
                        icon: FontAwesomeIcons.fileAlt,
                        iconColor: Colors.white,
                        backgroundColor: Colors.deepPurple[900],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/privacy'),
                      child: SettingsTile(
                        text: 'Privacy Policy ',
                        subtitle: '',
                        icon: Icons.privacy_tip,
                        iconColor: Colors.white,
                        backgroundColor: Colors.deepPurple[900],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SettingsGroup(text: 'Info'),
                    SizedBox(
                      height: 10.0,
                    ),
                    SettingsTile(
                      text: 'Version',
                      subtitle: '1.0 ( Beta Version )',
                      icon: Icons.info,
                      iconColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
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

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.backgroundColor,
    @required this.iconColor,
    @required this.subtitle,
  }) : super(key: key);

  final icon;
  final text;
  final backgroundColor;
  final iconColor;
  final subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Icon(
            icon,
            color: iconColor,
          ),
          backgroundColor: backgroundColor,
          radius: 20.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 13.0, color: Colors.grey[500]),
            ),
          ],
        ),
      ],
    );
  }
}

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({
    Key key,
    @required this.text,
  }) : super(key: key);

  final text;
  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(),
        style: GoogleFonts.bebasNeue(
          fontSize: 15.0,
          color: Colors.blueAccent,
          letterSpacing: 3,
        ));
  }
}
