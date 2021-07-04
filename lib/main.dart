import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: GoogleFonts.quicksand().fontFamily,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.orange, // sets the appbar theme color
      ),
      // home: CategoriesScreen(),
      routes: {
        "/":(context)=> TabScreen(),
        // When navigating to the "/" route, build the FirstScreen widget.
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName :(context) => MealDetailScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.

      },
      onUnknownRoute: (setting){
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}

