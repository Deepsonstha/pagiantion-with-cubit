import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pagination_cubit/dio_http_service.dart';

import '../../model/post.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  int page = 1;
  void loadPosts() async {
    if (state is PostsLoading) return;
    final currentState = state;
    var oldPosts = <Post>[];
    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }
    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));

    Response response = await DioHttpService().handleGetRequest('/posts',
        queryParameters: {'_limit': 10, '_page': page});

    var data = (response.data as List).map((e) => Post.fromJson(e)).toList();
    page++;
    final posts = (state as PostsLoading).oldPosts;
     print("mylll : $posts");
    posts.addAll(data);
    emit(PostsLoaded(posts: posts));
  }
}
