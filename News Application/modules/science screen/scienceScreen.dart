import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../shared/components/components.dart';

class scienceScreen extends StatelessWidget {
  const scienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var science = AppCubit.get(context).science;

        if (science.isEmpty) {
          print("No science news found.");
          return  Center(child: CircularProgressIndicator()); // Display a message when there are no tasks
        }

        var list =AppCubit.get(context).science;
        return ListView.separated(
          itemBuilder: (context, index) =>
              buildArticleItem(list[index],context),
          physics:BouncingScrollPhysics() ,

          separatorBuilder: (context, index) => Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          itemCount: science.length,
        );
      },
    );
  }
}