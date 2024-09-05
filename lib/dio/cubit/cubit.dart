import 'package:bloc/bloc.dart';
import 'package:sliver/dio/cubit/state.dart';
import 'package:sliver/dio/dio.dart';

class DioCubit extends Cubit<DioState> {
  final Services service;
  DioCubit({required this.service}) : super(const DioState());
  Future<void> get() async {
    emit(state.copyWith(loading: true));
    try {
      final data = await service.getData();
      emit(state.copyWith(loading: false, list: data));
    } catch (e) {
      emit(state.copyWith(loading: false, message: e.toString()));
    }
  }
}
