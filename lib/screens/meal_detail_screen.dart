import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_text.dart';
class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  Widget buildSectionTitle(BuildContext context, String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: TextStyle(fontSize: 20),),
    );
  }
  Widget buildContainer(Widget child){
    return  Container(
        margin: EdgeInsets.all(10),
    padding:EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Colors.white,
    border:Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(15),


    ),
    width: 300,
    height: 160,

    child:child,);
  }

  @override
  Widget build(BuildContext context) {

    final mealID = ModalRoute.of(context).settings.arguments as String;
    //logic =>
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
     body: SingleChildScrollView(
       child: Column(children: [
         Container(
           height: 300,
           width: double.infinity,
           child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),

         ),
         buildSectionTitle(context, 'Ingredients'),
       buildContainer( ListView.builder(itemBuilder: (context,index) => Card(
             color: Theme.of(context).accentColor,
             child: Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),child: Text(selectedMeal.ingredients[index])),
           ), itemCount: selectedMeal.ingredients.length,) ,
         ),       buildSectionTitle(context, 'Steps'),
         buildContainer(
           ListView.builder(itemBuilder: (context,index)=>
             Column(
               children: [
                 ListTile(
                   leading: CircleAvatar(child: Text('#${index +1}'),),
                   title: Text(selectedMeal.steps[index]),
                 ),
                 Divider(),
               ],
             ),itemCount: selectedMeal.steps.length,)
         )
       ],),
     ),
    );
  }
}
