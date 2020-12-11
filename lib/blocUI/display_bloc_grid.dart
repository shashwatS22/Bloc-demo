import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gridUpwork/bloc/griddata_bloc.dart';
import 'package:gridUpwork/blocUI/bloc_UI_screen.dart';
import 'package:gridUpwork/repo/data_repo.dart';

class DisplayBlocUi extends StatefulWidget {
  @override
  _DisplayBlocUiState createState() => _DisplayBlocUiState();
}

class _DisplayBlocUiState extends State<DisplayBlocUi> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GriddataBloc(dataRepository: DataRepository())
        ..add(GriddataFetchEvent()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: BlocUIScreen(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.lightbulb_outline_rounded,
                    size: 30,
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
