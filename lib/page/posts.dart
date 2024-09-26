import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Post {
  final int id;
  final String? video;
  final String userName;

  Post({required this.id, this.video, required this.userName});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      video: json['video'],
      userName: json['userName'],
    );
  }
}



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Posts(),
    );
  }
}

class Posts extends StatefulWidget {
  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://api.tischat.com/api/post/get/all'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        posts = jsonResponse.map((post) => Post.fromJson(post)).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body:ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].userName),
                  subtitle: posts[index].video != null
                      ? Text(posts[index].video!)
                      : Text("No video available"),
                );
              },
            ),
    );
  }
}
