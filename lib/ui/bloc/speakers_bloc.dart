import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/models/speaker.dart';

part 'speakers_event.dart';
part 'speakers_state.dart';

class SpeakersBloc extends Bloc<SpeakersEvent, SpeakersState> {
  SpeakersBloc(this.speakersRepository) : super(SpeakersLoading()) {
    on<FetchSpeakers>(_onFetchSpeakers);
    on<ToggleScheduleSpeaker>(_onToggleScheduleSpeaker);
  }

  final SpeakersRepository speakersRepository;

  FutureOr<void> _onFetchSpeakers(
    FetchSpeakers event,
    Emitter<SpeakersState> emit,
  ) async {
    emit(SpeakersLoading());
    final speakers = await speakersRepository.fetchSpeakers();
    emit(SpeakersDataLoaded(fullSpeakers: speakers));
  }

  FutureOr<void> _onToggleScheduleSpeaker(
    ToggleScheduleSpeaker event,
    Emitter<SpeakersState> emit,
  ) {
    final s = state as SpeakersDataLoaded;

    if (s.favoriteSpeakers.contains(event.speaker)) {
      final favs = List<Speaker>.from(s.favoriteSpeakers)
        ..remove(event.speaker);
      emit(s.copyWith(favoriteSpeakers: favs));
    } else {
      final favs = List<Speaker>.from(s.favoriteSpeakers)..add(event.speaker);
      emit(s.copyWith(favoriteSpeakers: favs));
    }
  }
}
