part of 'speakers_bloc.dart';

sealed class SpeakersState extends Equatable {
  const SpeakersState();

  @override
  List<Object> get props => [];
}

final class SpeakersLoading extends SpeakersState {}

final class SpeakersDataLoaded extends SpeakersState {
  final List<Speaker> fullSpeakers;
  final List<Speaker> favoriteSpeakers;

  const SpeakersDataLoaded({
    this.fullSpeakers = const [],
    this.favoriteSpeakers = const [],
  });

  SpeakersDataLoaded copyWith({
    List<Speaker>? fullSpeakers,
    List<Speaker>? favoriteSpeakers,
  }) {
    return SpeakersDataLoaded(
      fullSpeakers: fullSpeakers ?? this.fullSpeakers,
      favoriteSpeakers: favoriteSpeakers ?? this.favoriteSpeakers,
    );
  }

  @override
  List<Object> get props => [fullSpeakers, favoriteSpeakers];
}
