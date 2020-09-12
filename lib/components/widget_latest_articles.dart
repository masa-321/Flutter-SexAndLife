import 'package:flutter/material.dart';
import 'package:sex_and_life/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:sex_and_life/services/data_state.dart';

class WidgetLatestArticles extends StatelessWidget {

  static const double contentHeight = 192.0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final dataState = Provider.of<DataState>(context, listen: false);


    return Expanded(
      child: Consumer<DataState>(
        builder: (context, dataState, _) {
          //素晴らしい。
          return FutureBuilder(
            future: dataState.fetchArticleData(),
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              switch(snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  } else {
                    List<Article> articleData= snapshot.data;
                    return _buildWidgetArticleContents(dataState, mediaQuery, articleData);
                  }
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildWidgetArticleContents(DataState dataState, MediaQueryData mediaQuery, List<Article> articleData) {
    return ListView.builder( //ListView.separated()だと、表示する項目と項目の間に区切りをつけることが可能になり、separatorBuilder: (context, index) => Divider(),といったプロパティが必須となるっぽい。
      padding: EdgeInsets.zero,
      //separatorBuilder: (context, index) => Divider(),
      itemCount: articleData.length,//dataState.fetchArticles().length ← testArticles.length,
      itemBuilder: (context, index) {
        Article article = articleData[index];
        return Stack(
          children: <Widget>[
            ClipRRect(
              child: Image.network(article.imageUrl,fit: BoxFit.cover, height: contentHeight,width: mediaQuery.size.width,),
//              borderRadius: BorderRadius.all(
//                Radius.circular(8.0),
//              ),
            ),
            GestureDetector(
              //behavior: HitTestBehavior.translucent,
              onTap: () async {
                if (await canLaunch(article.url)) {
                  await launch(article.url);
                } else {
                  throw 'Could not launch ${article.url}';
                }
              },
              child: Container(
                width: mediaQuery.size.width,
                height: contentHeight,
                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(
//                    Radius.circular(8.0),
//                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.0,
                      0.7,
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: mediaQuery.size.width,
              height: contentHeight,
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(article.title, style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(article.sourceName, style: TextStyle(color: Colors.white, fontSize: 13.0)),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
