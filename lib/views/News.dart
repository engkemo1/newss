import 'package:flutter/material.dart';
import '../API Services/api_service.dart';
import '../model/article_model.dart';
import '../widget/customListTile.dart';

class Business extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Business> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("News", style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
        backgroundColor: Colors.green,
      ),

      body:SafeArea(
        child:
        FutureBuilder(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )
    );
  }
}
