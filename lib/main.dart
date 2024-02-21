import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';
void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});


// 1
 @override
 Widget build(BuildContext context) {
 // 2
 final ThemeData theme = ThemeData();
 // 3
 return MaterialApp(
 // 4
 title: 'Recipe Calculator',
 // 5
 theme: theme.copyWith(
 colorScheme: theme.colorScheme.copyWith(
 primary: Colors.grey,
 secondary: Colors.black,
 ),
),
 // 6
 home: const MyHomePage(title: 'Recipe Calculator'),
 );
 }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 @override
 Widget build(BuildContext context) {
 // 1
 return Scaffold(
 // 2
 appBar: AppBar(
 title: Text(widget.title),
 ),
 // 3
 body: SafeArea(
 // TODO: Replace child: Container()
 // 4
child: ListView.builder(
 // 5
 itemCount: Recipe.samples.length,
 // 6
 itemBuilder: (BuildContext context, int index) {
 // 7
return GestureDetector(
 // 8
 onTap: () {
 // 9
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) {
 // 10
 return RecipeDetail(recipe: Recipe.samples[index]);
 },
 ),
 );
 },
 // 11
 child: buildRecipeCard(Recipe.samples[index]),
);
 
 },
),
 ),
 );
 }
 Widget buildRecipeCard(Recipe recipe) {
 // 1
 return Card(
 // 2
 child: Column(
 // 3
 children: <Widget>[
 // 4
 Image(image: AssetImage(recipe.imageUrl)),
 // 5
 Text(recipe.label),
 ],
 ),
 );
}
}