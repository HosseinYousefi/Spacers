import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/posts/posts_state.dart';
import 'package:hs_app/domain/posts/post.dart';
import 'package:hs_app/domain/posts/posts_repo.dart';

class PostsBloc extends StateNotifier<PostsState> {
  final PostsRepo postsRepo;

  PostsBloc(List<Post> posts, this.postsRepo)
      : super(PostsState(posts: posts, newPostContent: ''));

  void postContentChanged(String content) {
    state = state.copyWith(newPostContent: content);
  }

  void postButtonPressed() {
    postsRepo.post('Hossein', 'dWiorOGf1gbCu9NKZ98VjuZQKXx1',
        state.newPostContent, DateTime.now());
  }
}

final postsStreamProvider = StreamProvider<List<Post>>((ref) {
  final postsRepo = ref.watch(postsRepoProvider);
  return postsRepo.watchPosts();
});

final postsBlocProvider = StateNotifierProvider<PostsBloc>((ref) {
  final postsRepo = ref.watch(postsRepoProvider);
  final posts = ref.watch(postsStreamProvider);
  return posts.when(
    data: (data) {
      print(data);
      return PostsBloc(data, postsRepo);
    },
    loading: () => PostsBloc([], postsRepo),
    error: (e, __) {
      print(e);
      return PostsBloc([], postsRepo);
    },
  );
});
