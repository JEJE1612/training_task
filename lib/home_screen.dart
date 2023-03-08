import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:training_task/components/customlisttile.dart';
import 'package:training_task/evaluation.dart';
import 'package:training_task/model/articale_model.dart';

import 'service/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "News App",
          style: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.star,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Rating()),
              );
            },
          )
        ],
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
                itemCount: articles!.length,
                itemBuilder: ((context, index) =>
                    customListTile(articles[index], context)));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: client.getArticle(),
      ),
    );
  }
}
