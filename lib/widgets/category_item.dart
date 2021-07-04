import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {

  // we create title , id and string to get that data from the category screen
  //now with that we show that container according to the dummy text and color
  final String id;

  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);
  //What this function does?
  //simply according to our container we cap navigate to a new screen where data is show according to the selected field
  void selectCategory(BuildContext context){

     Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {'id':id, 'title':title});
       //now to the screen we send id and title and that screen take the title and show with each particular way.
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        // alignment: Alignment.center,
        padding:const EdgeInsets.all(15),
        child: Text(title,style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, ),),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.7),
        color,],
        begin:Alignment.topLeft,end: Alignment.bottomRight,
        ),borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
