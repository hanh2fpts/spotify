import 'package:flutter_bloc/flutter_bloc.dart';

part 'play_audio_event.dart';
part 'play_audio_state.dart';

class PlayAudioBloc extends Bloc<PlayAudioEvent, PlayAudioState> {
  PlayAudioBloc() : super(PlayAudioInitial()) {
    on<PlayAudioEvent>((event, emit) {
    });
  }
}
