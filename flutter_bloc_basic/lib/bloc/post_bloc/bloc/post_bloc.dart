import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_basic/bloc/post_bloc/bloc/post_event.dart';
import 'package:flutter_bloc_basic/bloc/post_bloc/bloc/post_state.dart';
import 'package:flutter_bloc_basic/repository/post_repository.dart';
import 'package:flutter_bloc_basic/utils/enums.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository;
  PostBloc(this.postRepository) : super(const PostState()) {
    on<PostFeteched>(_postFetched);
  }

  void _postFetched(PostFeteched event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(
        state.copyWith(
          postList: value,
          postStatus: PostStatus.success,
          message: "success",
        ),
      );
    }).onError(
      (error, stackTrace) {
        emit(
          state.copyWith(
            postStatus: PostStatus.failure,
            message: error.toString(),
          ),
        );
      },
    );
  }
}
