import 'dart:convert' as convert ;
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:practice/apiCalling/models/post.dart';


class HttpGetPost{
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _endpoint = '/posts';

 Future<List<Post>> getPosts() async{
    List<Post> posts = [];
    try{
      Uri postUri = Uri.parse('$_baseUrl$_endpoint');
      http.Response response = await http.get(postUri);
      if(response.statusCode == 200){
        List<dynamic> postsList = convert.jsonDecode(response.body);
        for(var postsListItem in postsList){
          Post post = Post.fromJson(postsListItem);
          posts.add(post);
        }
      }
      return posts;
    }catch(e){
      log(e.toString());

    }
    return posts;

  }
}