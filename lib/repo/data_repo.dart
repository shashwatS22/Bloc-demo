import 'package:gridUpwork/models/grid_data_model.dart';

class DataRepository {
  GridData gd = GridData();
  static final DataRepository _dataRepository = DataRepository._();
  DataRepository._();
  factory DataRepository() {
    return _dataRepository;
  }

  Future<List<Data>> fetchData() async {
    return await gd.getGridDataList();
  }
}
