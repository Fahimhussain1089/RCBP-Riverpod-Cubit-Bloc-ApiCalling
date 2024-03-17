  import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/apiCalling/httpget_service.dart';
import 'package:practice/apiCalling/models/post.dart';

final postsProvider = StateNotifierProvider<PostsNotifier,PostState>(
    (ref) => PostsNotifier(),
);
@immutable
abstract class PostState{}

  class InitialPostState extends PostState{}

  class PostsLoadingPostState extends PostState{}

  class PostsLoadedPostState extends PostState{
    PostsLoadedPostState({
      required this.posts,});
    final List<Post> posts;
  }

  class ErrorPostsState extends PostState{
    ErrorPostsState({
      required this.message,
  });
  final String message;
  }

  class PostsNotifier extends StateNotifier<PostState>{
    PostsNotifier() :  super(InitialPostState());
    final HttpGetPost _httpGetPost = HttpGetPost();
    void fetchPosts() async{
      try{
        state = PostsLoadingPostState();
        List<Post> posts = await _httpGetPost.getPosts();
        state = PostsLoadedPostState(posts: posts);
      }catch(e){
        state  = ErrorPostsState(message: e.toString());
      }
    }
}