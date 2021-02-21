import 'package:orilla_fresca_app/models/category.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';

import 'appcolors.dart';
import 'iconhelper.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        color: AppColors.MEATS,
        name: "Carnes",
        imgName: "cat1",
        icon: IconFontHelper.MEATS,
        subCategories: [
          SubCategory(
            color: AppColors.MEATS,
            name: "Cerdo",
            imgName: "cat1_1",
            icon: IconFontHelper.MEATS
          ),
          SubCategory(
            name: "Vaca",
            imgName: "cat1_2",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
          ),
          SubCategory(
            name: "Gallina",
            imgName: "cat1_3",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
          ),
          SubCategory(
            name: "Pavo",
            imgName: "cat1_4",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
          ),
          SubCategory(
            name: "Chivo",
            imgName: "cat1_5",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
          ),
          SubCategory(
            name: "Conejo",
            imgName: "cat1_6",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
          )
        ]
      ),
      Category(
        color: AppColors.FRUITS,
        name: "Frutas",
        imgName: "cat2",
        icon: IconFontHelper.FRUITS,
        subCategories: []
      ),
      Category(
        color: AppColors.VEGS,
        name: "Vegetales",
        imgName: "cat3",
        icon: IconFontHelper.VEGS,
        subCategories: []
      ),
      Category(
        color: AppColors.SEEDS,
        name: "Semillas",
        imgName: "cat4",
        icon: IconFontHelper.SEEDS,
        subCategories: []
      ),
      Category(
        color: AppColors.PASTRIES,
        name: "Dulces",
        imgName: "cat5",
        icon: IconFontHelper.PASTRIES,
        subCategories: []
      ),
      Category(
        color: AppColors.SPICES,
        name: "Especies",
        imgName: "cat6",
        icon: IconFontHelper.SPICES,
        subCategories: []
      )
    ];
  }
}