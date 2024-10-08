import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_basic/model/post_model.dart';
import 'package:flutter_bloc_basic/utils/enums.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = "",
  });

  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postStatus, postList, message];
}
