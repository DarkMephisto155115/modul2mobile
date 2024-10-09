import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/get_connect_controller.dart';

class ArticlesScreen extends StatelessWidget {
  final GetConnectController controller = Get.put(GetConnectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.articles.isEmpty) {
          return Center(child: Text('No articles available'));
        } else {
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return ListTile(
                title: Text(article.title),
                subtitle: Text(article.author),
                leading: Image.network(article.urlToImage),
                onTap: () {
                  // Handle article tap if needed
                },
              );
            },
          );
        }
      }),
    );
  }
}
