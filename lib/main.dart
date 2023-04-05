import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_cubit/posts_screen.dart';

import 'cubit/posts/posts_cubit.dart';

void main() {
  runApp(const PaginationApp());
}

class PaginationApp extends StatelessWidget {
  const PaginationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit(),
        child: PostView(),
      ),
    );
  }
}
