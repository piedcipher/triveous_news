import 'package:flutter/material.dart';
import 'package:triveous_news/models/news_model.dart';
import 'package:triveous_news/utils/extensions.dart';
import 'package:triveous_news/utils/routes.dart';

class NewsListItem extends StatelessWidget {
  final NewsModel newsItem;

  const NewsListItem(this.newsItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, Routes.kDetails,
              arguments: newsItem.webUrl);
        },
        title: newsItem?.fields?.thumbnail != null
            ? Image.network(newsItem.fields.thumbnail)
            : Container(),
        subtitle: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  newsItem?.webTitle ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    newsItem.webPublicationDate.getFormattedLocalDateTime(),
                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white60),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
