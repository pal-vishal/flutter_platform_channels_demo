import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  // Open a URL with your custom scheme
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // add the required details in query params of this URL such as chat_id, auth_token, 
            // in order to open the expert chat . 
            openSafari("https://web.jumpingminds.ai/chat");
          }, // Replace with your button's action
          child: Text('Centered Button'),
        ),
      ),
    );
  }

  // Import the platform channel plugin

  Future<void> openSafari(String url) async {
    const platform = const MethodChannel('open_safari_for_iOS');
    try {
      await  platform.invokeMethod(
      'openSafari',
      <String, String>{
        'url': url
      },
    );
    } on PlatformException catch (e) {
      // Handle error
    }
  }
}
