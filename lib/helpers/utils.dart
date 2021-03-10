import 'package:flutter/material.dart';
import 'package:orilla_fresca_app/helpers/unitenums.dart';
import 'package:orilla_fresca_app/models/category.dart';
import 'package:orilla_fresca_app/models/categorypart.dart';
import 'package:orilla_fresca_app/models/onboardingcontent.dart';
import 'package:orilla_fresca_app/models/subcategory.dart';

import 'appcolors.dart';
import 'iconhelper.dart';

class Utils {
  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
        message: 'Productos\nfrescos, de la\ntierra a su mesa',
        img: 'onboard1'
      ),
      OnboardingContent(
        message: 'Carnes y embutidos\nfrescos y saludables\npara su deleite',
        img: 'onboard2'
      ),
      OnboardingContent(
        message: 'Adquiéralos desde\nla comodidad de su\ndispositivo móbil',
        img: 'onboard3'
      )
    ];
  }

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
            icon: IconFontHelper.MEATS,
            price: 5.0,
            parts: [
              CategoryPart(
                name: 'Jamon',
                imgName: 'cat1_1_p1',
                isSelected: false
              ),
              CategoryPart(
                name: 'Patas',
                imgName: 'cat1_1_p2',
                isSelected: false
              ),
              CategoryPart(
                name: 'Tocineta',
                imgName: 'cat1_1_p3',
                isSelected: false
              ),
              CategoryPart(
                name: 'Lomo',
                imgName: 'cat1_1_p4',
                isSelected: false
              ),
              CategoryPart(
                name: 'Costillas',
                imgName: 'cat1_1_p5',
                isSelected: false
              ),
              CategoryPart(
                name: 'Panza',
                imgName: 'cat1_1_p6',
                isSelected: false
              )
            ]
          ),
          SubCategory(
            name: "Vaca",
            imgName: "cat1_2",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            price: 10.0,
            parts: [
              CategoryPart(
                name: 'Costilla',
                imgName: 'cat1_3_p1',
                isSelected: false
              ),
              CategoryPart(
                name: 'Ribeye',
                imgName: 'cat1_3_p2',
                isSelected: false
              ),
              CategoryPart(
                name: 'Sirloin',
                imgName: 'cat1_3_p3',
                isSelected: false
              ),
              CategoryPart(
                name: 'Rabo',
                imgName: 'cat1_3_p4',
                isSelected: false
              ),
            ]
          ),
          SubCategory(
            name: "Gallina",
            imgName: "cat1_3",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            price: 8.0,
            parts: [
              CategoryPart(
                name: 'Alitas',
                imgName: 'cat1_2_p1',
                isSelected: false
              ),
              CategoryPart(
                name: 'Pechuga',
                imgName: 'cat1_2_p2',
                isSelected: false
              ),
              CategoryPart(
                name: 'Muslo',
                imgName: 'cat1_2_p3',
                isSelected: false
              ),
              CategoryPart(
                name: 'Patas',
                imgName: 'cat1_2_p4',
                isSelected: false
              ),
              CategoryPart(
                name: 'Corazones',
                imgName: 'cat1_2_p5',
                isSelected: false
              ),
            ]
          ),
          SubCategory(
            name: "Pavo",
            imgName: "cat1_4",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            price: 12.0,
            parts: [
              CategoryPart(
                name: 'Pechuga',
                imgName: 'cat1_4_p1',
                isSelected: false
              ),
              CategoryPart(
                name: 'Muslo',
                imgName: 'cat1_4_p2',
                isSelected: false
              ),
              CategoryPart(
                name: 'Alas',
                imgName: 'cat1_4_p3',
                isSelected: false
              )
            ]
          ),
          SubCategory(
            name: "Chivo",
            imgName: "cat1_5",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            price: 10.0,
            parts: [
              CategoryPart(
                name: 'Chuletas',
                imgName: 'cat1_5_p1',
                isSelected: false
              ),
              CategoryPart(
                name: 'Lomo',
                imgName: 'cat1_5_p2',
                isSelected: false
              ),
              CategoryPart(
                name: 'Pierna',
                imgName: 'cat1_5_p3',
                isSelected: false
              )
            ]
          ),
          SubCategory(
            name: "Conejo",
            imgName: "cat1_6",
            icon: IconFontHelper.MEATS,
            color: AppColors.MEATS,
            price: 15.0,
            parts: [
              CategoryPart(
                name: 'Lomo',
                imgName: 'cat1_6_p1',
                isSelected: false
              ),
              CategoryPart(
                name: 'Pierna',
                imgName: 'cat1_6_p2',
                isSelected: false
              )
            ]
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

  static String weightUnitToString(WeightUnits unit) {
    switch(unit) {
      case WeightUnits.Kg:
        return 'kg.';
      case WeightUnits.Lb:
        return 'lb.';
      case WeightUnits.Oz:
        return 'oz.';
      default:
        return 'lb.';
    }
  }

  static String deviceSuffix(BuildContext context) {
    String deviceSuffix = '';
    TargetPlatform platform = Theme.of(context).platform;
    switch(platform) {
      case TargetPlatform.android:
        deviceSuffix = '_android';
        break;
      case TargetPlatform.iOS:
        deviceSuffix = '_ios';
        break;
      default: 
        deviceSuffix = '';
        break;
    }

    return deviceSuffix;
  }
}