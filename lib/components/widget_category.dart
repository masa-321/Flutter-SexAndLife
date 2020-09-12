import 'package:flutter/material.dart';
import 'package:sex_and_life/models/category_model.dart';
import 'package:sex_and_life/components/widget_category_icon.dart';
import 'package:sex_and_life/services/data_state.dart';
import 'package:provider/provider.dart';

class WidgetCategory extends StatefulWidget {
  @override
  _WidgetCategoryState createState() => _WidgetCategoryState();
}

class _WidgetCategoryState extends State<WidgetCategory> {
  final List listCategories = [
    Category("","新着一覧"),
    Category('assets/category_images/image_body.png', '体のこと'),
    Category('assets/category_images/image_contraception.png', '避妊のこと'),
    Category('assets/category_images/image_health.png', '健康のこと'),
    Category('assets/category_images/image_lgbtq.png', 'LGBTQ+'),
    Category('assets/category_images/image_lifeplanning.png', 'ライフプランニング'),
    Category('assets/category_images/image_partnership.png', 'パートナーシップ'),
    Category('assets/category_images/image_sex.png', 'セックスのこと'),
  ];

  @override
  Widget build(BuildContext context) {

    final dataState = Provider.of<DataState>(context, listen: false);

    return Container(
      height: 74,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category itemCategory = listCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 10.0, //元々16
              right: index == listCategories.length - 1 ? 10.0 : 0.0,//元々 ? 16.0 : 0.0
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    dataState.changeCategory(index);
                    //Provider.of<DataState>(context, listen: false).changeLatestArticles(); //New!
                    print("onTapされた");
                  },
                  //child: WidgetCategoryIcon(index: index, itemCategory: itemCategory),
                   child: Consumer<DataState>(
                    builder: (context, dataState, _) {
                      return WidgetCategoryIcon(index: index, itemCategory: itemCategory);
                    },
                  )
                ),
                SizedBox(height: 4.0),

                Text(
                  itemCategory.title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,//Color(0xFF32584),
                    fontFamily: "Hiragino Sans",
                    fontWeight: dataState.indexSelectedCategory == index ? FontWeight.bold : FontWeight.normal
                  ),
                  strutStyle: StrutStyle(
                    fontSize: 14.0,
                    height: 1.6, //英語と日本語の高さを揃えるためのオプション
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: listCategories.length,
      ),
    );
  }
}

