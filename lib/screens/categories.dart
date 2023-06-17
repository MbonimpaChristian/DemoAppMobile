import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// void main() => runApp(categories());
class Category{
  int id;
  String name;
  Category({
    required this.id,
    required this.name
});
  factory Category.fromJson(Map<String,dynamic>json){
    return Category(id: json['id'], name: json['name']);
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
   CategoriesState createState()=>CategoriesState();}
class CategoriesState extends State<Categories>{
   // categories({super.key});
  late Future <List<Category>> futureCategories;
  final _formkey=GlobalKey <FormState>();
  late Category selectedCategory;
  final categoryNameController =TextEditingController();
  Future <List<Category>> fetchCategories() async{
    http.Response response= await http.get(
      Uri.parse('http://futter-api.laraveldaily.com/api/categories')
    );
    List categories=jsonDecode(response.body);
    return categories.map((category) => Category.fromJson(category)).toList();
  }
  Future saveCategory() async{
    final form= _formkey.currentState;
    String uri='http://futter-api.laraveldaily.com/api/categories/'+ selectedCategory.id.toString();
    await http.put(Uri.parse(uri),
    headers: {
      HttpHeaders.contentTypeHeader:'application/json',
      HttpHeaders.acceptHeader:'application/json',
        },
      body: jsonEncode({'name':categoryNameController.text})
    );
    Navigator.pop(context);
  }
  @override
  void initState(){
    super.initState();
    futureCategories=fetchCategories();
  }

  // const MyApp({super.key});

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text ('Categories'),
      ),
      body: FutureBuilder<List<Category>>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Category category = snapshot.data![index];
                return ListTile(
                    title: Text(category.name),
                    trailing: IconButton(icon:
                Icon(Icons.edit),
                onPressed: (){
                      selectedCategory=category;
                      categoryNameController.text=category.name;
                      showModalBottomSheet(
                          context: context,
                          builder: (context){
                        return Padding(
                            padding: EdgeInsets.all(10),
                        child: Form(
                            key: _formkey,
                            child:Column(children: <Widget>[
                          TextFormField(
                          controller: categoryNameController,
                              validator: (String? value){
                            if (value!.isEmpty){
                              return 'Enter category name';
                            }
                              return null;
                              },
                              decoration:InputDecoration(
                            border: OutlineInputBorder(),
                          labelText: 'Category name',
                        ),),

                          ElevatedButton(
                              child:Text('Save'), onPressed: ()=>saveCategory()
                            ,)
                        ],),),);

                      }
                      );
                },
                ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Something went wrong ');
          }
          return const CircularProgressIndicator();
        }
      )
    );
  }
}
