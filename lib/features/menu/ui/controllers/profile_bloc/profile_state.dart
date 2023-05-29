part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileFetchedState extends ProfileState {
  final ProfileEntity profileEntity;

  ProfileFetchedState({required this.profileEntity});
}

class ProfileFailedState extends ProfileState {
  final Exception exception;
  ProfileFailedState({required this.exception});
}
