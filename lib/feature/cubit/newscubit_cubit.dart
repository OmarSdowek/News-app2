import 'package:bloc/bloc.dart';

import '../service/search_screen_service.dart';
import '../service/service.dart';
import 'newscubit_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> fetchTopHeadlines() async {
    emit(NewsLoading());
    try {
      final data = await HomeScreenService.getTopHeadLineArticle();
      emit(NewsSuccessed(data));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }


  Future<void> fetchSearchData({
    required String query
})
  async{
    emit(NewsLoading());

    try{
      final response = await SearchScreenService.getSearchResult(query);
      emit(NewsSuccessed(response));
    }catch(e){
      emit(NewsError(e.toString()));
    }



  }

}
