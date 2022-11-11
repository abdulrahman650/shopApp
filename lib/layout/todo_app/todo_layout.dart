import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/componant/comDefaultFormField.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';


class HomeLayout extends StatelessWidget
{

  var scafflodKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();


  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state){
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context , AppStates state)
        {

          AppCubit cubit =AppCubit.get(context);

          return Scaffold(
            key: scafflodKey,
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: Text(
                  cubit.title[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(
                      title: titleController.text ,
                        date: timeController.text ,
                        time: timeController.text
                    );
                  }
                } else {
                  scafflodKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          DefaultFormField(
                            controller: titleController,
                            labelText: 'Task Tile',
                            prefixIcon: Icons.title,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'title must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormField(
                            controller: timeController,
                            labelText: 'Task time',
                            prefixIcon: Icons.watch_later,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'time must not be empty';
                              }
                              return null;
                            },
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text =
                                    value!.format(context).toString();
                                print(value.format(context));
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DefaultFormField(
                            controller: dateController,
                            labelText: 'Task date',
                            prefixIcon: Icons.calendar_today,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'date must not be empty';
                              }
                              return null;
                            },
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101))
                                  .then((value) {
                                print(DateFormat.yMMMd().format(value!));
                                dateController.text =
                                    DateFormat.yMMMd().format(value);
                              });
                            },
                          ),
                        ]),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value)
                  {
                    cubit.changeBottomSheetState
                      (
                        icon: Icons.edit,
                        isShow: false
                     );
                  });
                  cubit.changeBottomSheetState
                    (
                      icon: Icons.add,
                      isShow: true,
                  );
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(

              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
                // setState(() {
                //
                // });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.deepOrangeAccent,
                  ),
                  label: 'new_tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                    color: Colors.deepOrangeAccent,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
