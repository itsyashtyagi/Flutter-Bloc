import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/post_bloc/bloc/post_bloc.dart';
import 'package:flutter_bloc_basic/bloc/post_bloc/bloc/post_event.dart';
import 'package:flutter_bloc_basic/bloc/post_bloc/bloc/post_state.dart';
import 'package:flutter_bloc_basic/utils/enums.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(PostFeteched());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post Screen"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              switch (state.postStatus) {
                case PostStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PostStatus.failure:
                  return Center(
                    child: Text(state.message.toString()),
                  );
                case PostStatus.success:
                  return ListView.builder(
                    itemCount: state.postList.length,
                    itemBuilder: (context, index) {
                      final item = state.postList[index];
                      return ListTile(
                        title: Text(
                          item.email.toString(),
                        ),
                      );
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
