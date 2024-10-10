part of 'speakers_bloc.dart';

sealed class SpeakersEvent extends Equatable {
  const SpeakersEvent();

  @override
  List<Object> get props => [];
}

class FetchSpeakers extends SpeakersEvent {
  const FetchSpeakers();
}

class ToggleScheduleSpeaker extends SpeakersEvent {
  final Speaker speaker;

  const ToggleScheduleSpeaker({required this.speaker});

  @override
  List<Object> get props => [speaker];
}
