import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/cubit.dart';
import 'package:newsapp/shared/componant/componant_newsapp.dart';

import '../../layout/news_app/cubit/states.dart';
import '../../shared/componant/comDefaultFormField.dart';

class SearchScreen extends StatelessWidget {


  TextEditingController SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context ,state){},
      builder: (context ,state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
                children:
                [
                Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DefaultFormField(
                        controller:SearchController,
                        keyboardType: TextInputType.text,
                        // onChange: (value)
                        // {
                        //   NewsCubit.get(context).getSearch(value);
                        // },
                        onTap: (value) {
                          NewsCubit.get(context).getSearch(value);
                        },
                        validator: (value)
                        {
                          if(value.isEmpty)
                          {
                            return 'search must not be empty';
                          }
                          return null;
                        },
                        labelText: "Search",
                        prefixIcon: Icons.search,

                      ),
                    ),
                  Expanded(
                    child: articleBuilder(
                        list, context,isSearch :true),),
                ],
              ),

         
        );
      },

    );
  }
}
