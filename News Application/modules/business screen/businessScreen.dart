import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/bloc/cubit.dart';

import '../../bloc/states.dart';
import '../../shared/components/components.dart';

class businessScreen extends StatelessWidget {
  const businessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var business = AppCubit.get(context).business;

        if (business.isEmpty) {
          print("No business news found.");
          return  Center(child: CircularProgressIndicator());// Display a message when there are no tasks
        }

        print("Business News : $business"); // Debug: print task details
        var list =AppCubit.get(context).business;
        return ListView.separated(
          itemBuilder: (context, index) =>
              buildArticleItem(list[index],context),
          physics:BouncingScrollPhysics() ,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          itemCount: business.length,
        );
      },
    );

  }
}