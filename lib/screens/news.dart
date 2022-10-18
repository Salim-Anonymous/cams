import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import "package:http/http.dart";
//stateful widget with nav bar

class News {
  String title;
  String description;
  String urlToImage;
  String content;
  News({required this.title, required this.description, required this.urlToImage, required this.content});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
    );
  }
}

class NewsScreen extends StatefulWidget{
  const NewsScreen({Key? key}) : super(key: key);

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 212, 109, 0.9),
      body: Center(
        child: DraggableHome(
            title: const Text("News Feeds"),
            headerWidget: headerWidget(context),
            headerBottomBar: headerBottomBarWidget(),
            body: [listView()],
            fullyStretchable: true,
        ),
      ),
    );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  //news data
  List<News> news = [];

  //fetch news data
  Future<News> getNews() async {
    String url = "http://192.168.44.198:3500/news";
    Response response = await get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    News.fromJson(response.body);

  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(251, 212, 109, 0.9),
      child: Center(
        child: Column(
          children: [
            Text(
              "News Feeds",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                getNews();
              },
              child: const Text("Get News"),
            ),
          ],
        ),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30, bottom: 40),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Title"),
          subtitle: const Text("Subtitle"),
        ),
      ),
    );
  }
}