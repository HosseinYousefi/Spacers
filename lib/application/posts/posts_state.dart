import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hs_app/domain/posts/post.dart';

part 'posts_state.freezed.dart';

@freezed
abstract class PostsState with _$PostsState {
  const factory PostsState({
    required List<Post> posts,
    required String newPostContent,
  }) = _PostsState;
}
