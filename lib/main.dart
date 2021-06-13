import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_example/post_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrofit',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Retrofit',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  FutureBuilder<List<Post>> _buildBody(BuildContext context) {
    final client =
        RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<Post>>(
        future: client.getTask(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Post>? posts = snapshot.data;
            return _buildPosts(context, posts!);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  ListView _buildPosts(BuildContext context, List<Post> posts) {
    return ListView.builder(
        itemCount: posts.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
              elevation: 4,
              child: ListTile(
                  title: Text(
                    posts[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(posts[index].email),
                  leading: Column(
                    children: <Widget>[
                      Image.network(
                        posts[index].picture,
                        width: 50,
                        height: 50,
                      ),
                    ],
                  )));
        });
  }
}
