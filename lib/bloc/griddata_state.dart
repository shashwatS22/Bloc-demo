part of 'griddata_bloc.dart';

@immutable
abstract class GriddataState {
  GriddataState();
}

class GriddataInitial extends GriddataState {
  GriddataInitial();
}

class GriddataLoading extends GriddataState {
  GriddataLoading();
}

class GriddataSuccess extends GriddataState {
  final List<Data> dataList;
  GriddataSuccess({this.dataList});
}

class GriddataError extends GriddataState {
  final String error;
  GriddataError({this.error});
}
