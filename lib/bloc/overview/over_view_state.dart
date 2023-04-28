part of 'over_view_bloc.dart';

abstract class OverViewState {}

class OverViewInitial extends OverViewState {}

class InitDataSuccess extends OverViewState {
  final List<SongModel> listSong;

  InitDataSuccess({required this.listSong});
}
