part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class SelectedTabBar extends HomeState {}

class BackHome extends HomeState {}

class ProfileLoading extends HomeState {}

class ProfileUpdateSuccess extends HomeState {}

class ProfileUpdateError extends HomeState {
  final String? error;
  ProfileUpdateError({this.error});
}

class PointsSettingsLoading extends HomeState {}

class PointsSettingsDone extends HomeState {
  String gainFactor;
   String redeemFactor;
 String settingsId;
  PointsSettingsDone({required this.gainFactor, required this.redeemFactor, required this.settingsId});
}

class PointsSettingsError extends HomeState {}
