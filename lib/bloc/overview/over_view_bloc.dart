import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'over_view_event.dart';
part 'over_view_state.dart';

class OverViewBloc extends Bloc<OverViewEvent, OverViewState> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  OverViewBloc() : super(OverViewInitial()) {
    on<OverViewEvent>((event, emit) {});
    on<InitDataEvent>(initData);
  }
  void initData(InitDataEvent event, Emitter<OverViewState> emit) async {
    requestStoragePermission();
    var data = await _audioQuery.querySongs(
        uriType: UriType.EXTERNAL,
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        ignoreCase: null);
    emit(InitDataSuccess(listSong: data));
  }

  void requestStoragePermission() async {
    bool permissionStatus = await _audioQuery.permissionsStatus();
    if (!permissionStatus) {
      await _audioQuery.permissionsRequest();
    }
  }
}
