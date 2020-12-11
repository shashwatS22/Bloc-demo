import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gridUpwork/models/grid_data_model.dart';
import 'package:gridUpwork/repo/data_repo.dart';
import 'package:meta/meta.dart';

part 'griddata_event.dart';
part 'griddata_state.dart';

class GriddataBloc extends Bloc<GriddataEvent, GriddataState> {
  final DataRepository dataRepository;
  GriddataBloc({this.dataRepository}) : super(GriddataInitial());

  @override
  Stream<GriddataState> mapEventToState(
    GriddataEvent event,
  ) async* {
    if (event is GriddataFetchEvent) {
      yield GriddataLoading();
      final List<Data> data = await dataRepository.fetchData();
      if (data != null) {
        yield GriddataSuccess(dataList: data);
      } else {
        yield GriddataError();
      }
    } else {
      yield GriddataError();
    }
  }
}
