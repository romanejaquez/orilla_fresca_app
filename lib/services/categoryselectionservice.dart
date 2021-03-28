import 'package:orilla_fresca_app/models/category.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';

class CategorySelectionService {

  Category _selectedCategory;
  SubCategory _selectedSubCategory;

  Category get selectedCategory  => _selectedCategory;
  set selectedCategory(Category value) {
    _selectedCategory = value;
  }

  SubCategory get selectedSubCategory  => _selectedSubCategory;
  set selectedSubCategory(SubCategory value) {
    _selectedSubCategory = value;
  }
}