import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/post_repository.dart';

class HomePageState {
  final bool isLoading;
  final List<Post> posts;

  HomePageState({
    required this.isLoading,
    required this.posts,
  });
}

class HomePageBloc extends StateNotifier<HomePageState> {
  PostRepository postRepository;

  HomePageBloc({
    required this.postRepository,
  }) : super(HomePageState(
          isLoading: true,
          posts: [],
        )) {
    postRepository.watchAllPosts().listen((posts) {
      state = HomePageState(
        isLoading: false,
        posts: posts,
      );
    });
  }

  Future<bool> likePressed(int id) {
    state = HomePageState(
      isLoading: state.isLoading,
      posts: state.posts..[id].likeStatus = LikeStatus.liked,
    );
    return postRepository.like(id);
  }

  Future<bool> dislikePressed(int id) {
    state = HomePageState(
      isLoading: state.isLoading,
      posts: state.posts..[id].likeStatus = LikeStatus.disliked,
    );
    return postRepository.dislike(id);
  }
}

final homePageBlocProvider = StateNotifierProvider<HomePageBloc>((ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return HomePageBloc(postRepository: postRepository);
});
