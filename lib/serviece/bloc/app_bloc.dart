import 'package:bloc/bloc.dart';
import 'package:task_project/serviece/bloc/app_events.dart';
import 'package:task_project/serviece/bloc/app_state.dart';
import 'package:task_project/serviece/repository/repositories.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;
  DataBloc(this.dataRepository) : super(DataLoading()) {
    on<LoadDataEvent>((event, emit) async {
      emit(DataLoading());
      try {
        final data = await dataRepository.getData();
        emit(DataLoaded(data));
      } catch (e) {
        emit(DataError(e.toString()));
      }
    });
  }
}