import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../shared/components/components.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<AppCubit, appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context); // Get the cubit instance
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFromField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    cubit.getsearchData(value!); // Trigger search
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Key Word";
                    }
                    return null;
                  },
                  label: "Search",
                  prefix: Icon(Icons.search),
                ),
              ),
              // Show the search results if there are any
              Expanded(
                child: cubit.search.isEmpty
                    ? Center(child: Text("No results found"))
                    : ListView.builder(
                  itemCount: cubit.search.length,
                  itemBuilder: (context, index) {
                    var article = cubit.search[index]; // Get each article
                    return buildArticleItem(article, context); // Pass the article
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
