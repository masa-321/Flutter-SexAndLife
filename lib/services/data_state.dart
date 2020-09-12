import 'package:flutter/material.dart';
import 'package:sex_and_life/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class DataState extends ChangeNotifier {
  int _indexSelectedCategory = 0;

  //List _articles = [];

  void changeCategory(int index) {
    _indexSelectedCategory = index;
    notifyListeners();
    print("changeCategoryメソッドが呼ばれた");
  }

  int get indexSelectedCategory {
    return _indexSelectedCategory;
  }

  //async await使う中で、戻り値の型はFutureである必要がある。
  Future<List<Article>>  fetchArticleData() async {
    QuerySnapshot _articleData;
    if (_indexSelectedCategory == 0) {
      _articleData = await _firestore.collection("articleData").orderBy("date", descending: true).limit(30).getDocuments(); //orderBy("date", descending: true)で昇順になったっぽい
      for (var article in _articleData.documents) {
        print(article.data);
        category0.clear();
        category0.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category0;
    } else if (_indexSelectedCategory == 1) {
      _articleData = await _firestore.collection("articleData").orderBy("date", descending: true).limit(30).where("genreName", isEqualTo: "体のこと").getDocuments();
      for (var article in _articleData.documents) {
        print(article.data);
        category1.clear();
        category1.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category1;
    } else if (_indexSelectedCategory == 2) {
      _articleData = await _firestore.collection("articleData").where("genreName", isEqualTo: "避妊のこと").limit(30).orderBy("date", descending: true).getDocuments();
      for (var article in _articleData.documents) {
        print(article.data);
        category2.clear();
        category2.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category2;
    } else if (_indexSelectedCategory == 3) {
      _articleData = await _firestore.collection("articleData").where("genreName", isEqualTo: "健康のこと").limit(30).orderBy("date", descending: true).getDocuments();
      for (var article in _articleData.documents) {
        print(article.data);
        category3.clear();
        category3.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category3;
    } else if (_indexSelectedCategory == 4) {
      _articleData = await _firestore.collection("articleData").where("genreName", isEqualTo: "LGBTQ+").limit(30).orderBy("date", descending: true).getDocuments();
      for (var article in _articleData.documents) {
        print(article.data);
        category4.clear();
        category4.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category4;
    } else if (_indexSelectedCategory == 5) {
      _articleData = await _firestore.collection("articleData").where("genreName", isEqualTo: "ライフプランニング").limit(30).orderBy("date", descending: true).getDocuments();
      for (var article in _articleData.documents) {
        print(article.data);
        category5.clear();
        category5.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category5;
    } else if (_indexSelectedCategory == 6) {
      _articleData = await _firestore.collection("articleData").where("genreName", isEqualTo: "パートナーシップ").limit(30).orderBy("date", descending: true).getDocuments();
      for (var article in _articleData.documents) {
        print(article.data);
        category6.clear();
        category6.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category6;
    } else if (_indexSelectedCategory == 7) {
      _articleData = await _firestore.collection("articleData").where("genreName", isEqualTo: "セックスのこと").limit(30).orderBy("date", descending: true).getDocuments();
      for (var article in _articleData.documents) {
        print(article.data);
        category7.clear();
        category7.add(
            Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"], sourceName: article.data["sourceName"])
        );
      }
      return category7;
    }
//    final articles = await _firestore.collection("articleData").where("genreName", isEqualTo: "パートナーシップ").limit(30).getDocuments();
//    for (var article in articles.documents) {
//      print(article.data);
//      testArticles.add(
//        Article(title: article.data["titleStr"], imageUrl: article.data["imageUrl"], category: article.data["genreName"], summary: article.data["summary"] ,url: article.data["articleUrl"])
//      );
//    }
  }

//  //List<Articles>だとエラーが出る様子。
//  List<Article> fetchArticles() {
//    List<Article> _articles = [];
//    if (_indexSelectedCategory == 3) {
//      _articles = testArticles.where((element) => element.category == "Health")
//          .toList(); //whereと言う関数が使える。
//      return _articles;
//    } else {
//      _articles = testArticles;
//      return _articles;
//    }
//  }
}

List<Article> category0 = [];
List<Article> category1 = [];
List<Article> category2 = [];
List<Article> category3 = [];
List<Article> category4 = [];
List<Article> category5 = [];
List<Article> category6 = [];
List<Article> category7 = [];


List<Article> testArticles = [
  Article(title: "testTitle1",imageUrl: "https://cdn.pixabay.com/photo/2020/05/04/07/49/flowers-5128200_1280.jpg",category: "",summary: "testSummary1",url: "https://seicil.com/qa42"),
  Article(title: "testTitle2",imageUrl: "https://cdn.pixabay.com/photo/2020/05/02/04/19/butterfly-5119823_1280.jpg",category: "",summary: "testSummary2", url: "https://seicil.com/qa26"),
  Article(title: "testTitle3",imageUrl: "https://cdn.pixabay.com/photo/2015/08/05/21/22/silver-bordered-fritillary-877121_1280.jpg",category: "",summary: "testSummary3", url: "https://seicil.com/qa20/"),
  Article(title: "testTitle4",imageUrl: "https://cdn.pixabay.com/photo/2020/05/04/15/40/sparrow-5129646_1280.jpg",category: "Business",summary: "testSummary4", url: "https://seicil.com/qa09/"),
  Article(title: "testTitle1",imageUrl: "https://cdn.pixabay.com/photo/2020/02/28/15/35/bird-4887736_1280.jpg",category: "Entertainment",summary: "testSummary1",url: "https://seicil.com/qa42"),
  Article(title: "testTitle2",imageUrl: "https://cdn.pixabay.com/photo/2016/08/22/10/20/city-1611657_1280.jpg",category: "Health",summary: "testSummary2", url: "https://seicil.com/qa26"),
  Article(title: "testTitle3",imageUrl: "https://cdn.pixabay.com/photo/2020/05/05/20/53/pond-5135097_1280.jpg",category: "Health",summary: "testSummary3", url: "https://seicil.com/qa20/"),
  Article(title: "testTitle4",imageUrl: "https://cdn.pixabay.com/photo/2020/04/30/14/03/mountains-and-hills-5112952_1280.jpg",category: "Health",summary: "testSummary4", url: "https://seicil.com/qa09/"),
];