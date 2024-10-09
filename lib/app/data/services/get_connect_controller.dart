import 'package:get/get.dart';
import 'package:modul2mobile/app/data/services/article_response.dart';
import 'article_response.dart'; // Assuming the model is saved as articles_response.dart

class GetConnectController extends GetConnect {
  static const String _baseUrl = 'https://my-json-server.typicode.com/Fallid/codelab-api/';

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true; // set loading state to true
      final response = await get('${_baseUrl}db');

      if (response.statusCode == 200) {
        final articlesResult = ArticlesResponse.fromJson(response.body);
        articles.value = articlesResult.articles;
      } else {
        print("Request failed with status ${response.statusCode}");
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false; // set status loading to false when done
    }
  }
}
