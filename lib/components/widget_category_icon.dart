import 'package:flutter/material.dart';
import 'package:sex_and_life/models/category_model.dart';
import 'package:sex_and_life/models/article_model.dart';
import 'package:provider/provider.dart';
import 'package:sex_and_life/services/data_state.dart';

class WidgetCategoryIcon extends StatelessWidget {

  //int indexSelectedCategory;
  int index; //Listにおける番号。何番目に並んでいるか
  Category itemCategory; //iconのimage pathと、titleが入ってる

  WidgetCategoryIcon({/*this.indexSelectedCategory, */this.index, this.itemCategory});

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? Container(
            width: 80.0, //48
            height: 48.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFBDCDDE),
              border: Provider.of<DataState>(context, listen: false).indexSelectedCategory == index
                  ? Border.all(
                color: Colors.black54,
                width: 4.0,
              )
                  : null,
            ),
            child: Icon(
              Icons.apps,
              color: Colors.white,
            ),
          )
        : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(itemCategory.image),
                  fit: BoxFit.contain//BoxFit.cover,
                ),
                border: Provider.of<DataState>(context, listen: false).indexSelectedCategory == index
                    ? Border.all(
                  color: Colors.black54,
                  width: 4.0,
                )
                    : null,
              ),
            ),
        );
  }
}