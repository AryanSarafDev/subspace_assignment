import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_assignment/blocs/fetch_cubit/fetch_state.dart';
import 'package:subspace_assignment/models/blog_model.dart';
import 'package:subspace_assignment/services/fetchblogs.dart';

class FetchCubit extends Cubit<Fetch> {
  FetchCubit() : super(FetchLoading()) {
    load();
  }
  void load() async {
    try {
      BlogList blogs;
      await fetchBlogs().then((value){
        blogs = value;
        emit(FetchLoaded(blogs));
    });


    } catch (e) {
      print(e.toString());
      emit(FetchError(e.toString()));
    }
  }
}
