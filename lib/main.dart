// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/layout/news_app/cubit/cubit.dart';
import 'package:newsapp/shared/bloc_observer.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/state.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';



import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/todo_layout.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/login/login_screen.dart';



void main() async
{
  //بيتاكد ان كل حاجه خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
   await CacheHelper.init();

   bool isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}


class MyApp extends StatelessWidget
{
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getScience()..getSports(),),
        BlocProvider(create: (BuildContext context)=> AppCubit()..changeAppMode(
          fromShared: isDark,
        ),)
      ],
      child: BlocConsumer<AppCubit , AppStates >(
       listener: (context, state){},
        builder: (context, state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: HexColor('333739'),
             appBarTheme: AppBarTheme(
               titleSpacing: 20.0,
               iconTheme: IconThemeData(
                 color: Colors.white,
               ),
               backwardsCompatibility: false,
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: HexColor('333739'),
                 statusBarBrightness: Brightness.light,
               ),
               backgroundColor: HexColor('333739'),
               elevation: 0.0,
               titleTextStyle: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             floatingActionButtonTheme: FloatingActionButtonThemeData(
               backgroundColor: Colors.deepOrange,
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.deepOrange[300],
               unselectedItemColor: Colors.grey,
               elevation: 20.0,
               backgroundColor: Colors.white,
             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: 18.0,
                 color: Colors.black,

               ),
             ),
           ),
           darkTheme: ThemeData(
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: HexColor('333739'),
             appBarTheme: AppBarTheme(
               titleSpacing: 20.0,
               iconTheme: IconThemeData(
                 color: Colors.white,
               ),
               backwardsCompatibility: false,
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: HexColor('333739'),
                 statusBarBrightness: Brightness.light,
               ),
               backgroundColor: HexColor('333739'),
               elevation: 0.0,
               titleTextStyle: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             floatingActionButtonTheme: FloatingActionButtonThemeData(
               backgroundColor: Colors.deepOrange,
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.deepOrange[300],
               unselectedItemColor: Colors.grey,
               elevation: 20.0,
               backgroundColor: HexColor('333739'),
             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: 18.0,
                 color: Colors.white,

               ),
             ),
           ),
           themeMode:
           // isDark? ThemeMode.dark : ThemeMode.light,
           AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,

           home: NewsLayout(),
         );
        },
      ),
    );

  }
}
