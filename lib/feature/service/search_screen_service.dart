import '../../core/constants/constatant.dart';
import '../../core/model/top_headline_model.dart';
import '../../core/networking/dio_helper.dart';
import '../../core/networking/end_point.dart';

class SearchScreenService {
  static getSearchResult( String query) async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: EndPoint.searchEndpoint,
        query: {"apiKey": Constatant.apiKey, "q": query},
      );

      if (response?.statusCode == 200) {
        return TopHeadLinesModel.fromJson(response!.data); // ✅ هنا لازم نستخدم !
      } else {
        return Future.error("Unexpected response");
      }

    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }

}