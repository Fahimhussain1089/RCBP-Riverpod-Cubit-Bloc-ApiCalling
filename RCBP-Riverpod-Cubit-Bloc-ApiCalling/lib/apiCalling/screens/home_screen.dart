import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/apiCalling/models/post.dart';
import 'package:practice/apiCalling/state/post_state.dart';

class home_screen extends ConsumerWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Home screen'),
      ),
      body: Center(
        child: Consumer(
          builder: (context,ref,child){
            PostState state = ref.watch(postsProvider);
            if(state is InitialPostState){
              return Text("Press FAB to Fetch data");
            }
            if(state is PostsLoadingPostState){
              return CircularProgressIndicator();
            }
            if(state is ErrorPostsState){
              return Text(state.message);
            }
            if (state is PostsLoadedPostState){
              return _buildListView(state);
            }
            return const Text('Nathing found here');

          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(postsProvider.notifier).fetchPosts();

        },
        child: const  Icon(Icons.favorite_border),
      ),
    );
  }

  Widget _buildListView(PostsLoadedPostState state) {
    return ListView.builder(
      itemCount: state.posts.length,
        itemBuilder: (context,index){
        Post post = state.posts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              post.id.toString(),
            ),
          ),
          title: Text(post.body.toString()),
        );
        }
    );
  }
}
