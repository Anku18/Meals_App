import 'package:flutter/material.dart';
import '../Widgets/mealItem.dart';
import '../Models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'categorty-Meals';

  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);
// final String CatergoryId;
//final String CatergoryTitle;

//  CategoryMealsScreen(this.CatergoryId, this.CatergoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catergoryTitle = routeArgs['title'];
    final catergoryId = routeArgs['id'];
    final categoryMeals = _availableMeals.where((meal) {
      return meal.categories.contains(catergoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catergoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
