import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HomePage extends StatelessWidget {
  var style = MarkdownStyleSheet(
        textAlign: WrapAlignment.center,
        h1Align: WrapAlignment.center,
         h1: const TextStyle(color: Colors.orangeAccent, fontSize: 40),
         textScaleFactor: 1.5,
  
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: FutureBuilder(
            future: rootBundle.loadString("lib/assests/assets/hello.md"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
      data: snapshot.data!,
      
      styleSheet: style,
      
    );
              }
    
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}