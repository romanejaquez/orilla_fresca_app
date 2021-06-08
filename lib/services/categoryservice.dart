import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orilla_fresca_app/models/category.dart';

class CategoryService {

  FirebaseFirestore? _instance;

  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance!.collection('orilla_fresca_data');

    DocumentSnapshot snapshot = await categories.doc('categories').get();
    var data = snapshot.data() as Map;
    var categoriesData = data['categories'] as List<dynamic>;
    categoriesData.forEach((catData) {
        Category cat = Category.fromJson(catData);
        _categories.add(cat);   
    });
  }
}