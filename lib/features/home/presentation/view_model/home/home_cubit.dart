import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappwithphp/core/utils/sqlflite.dart';
import 'package:noteappwithphp/features/home/presentation/view_model/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  getUserData() async {
    emit(HomeLoading());
    List data = await SqlDb().getData("SELECT * FROM `user`");
    if (data[0] != null) {
      print("xxxxxx $data");
      emit(HomeSuccess(userData: data[0]));
    } else {
      emit(HomeFailure(errMessage: "Error yama"));
    }
  }
}
