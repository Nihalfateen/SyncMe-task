part of 'redeem_points_cubit.dart';

@immutable
sealed class RedeemPointsState {}

final class RedeemPointsInitial extends RedeemPointsState {}

class SelectedTabBar extends RedeemPointsState {}

class SelectedSwitch extends RedeemPointsState {}

class RedeemProductsError extends RedeemPointsState {}

class RedeemProductsLoading extends RedeemPointsState {}

class RedeemProductsSuccess extends RedeemPointsState {}

class RedeemPointsError extends RedeemPointsState {
  final String? error;
  RedeemPointsError({this.error});
}

class RedeemPointsLoading extends RedeemPointsState {}

class RedeemPointsSuccess extends RedeemPointsState {
  final String encryptionQr;
  final String keyQr;

  RedeemPointsSuccess({
    required this.encryptionQr,
    required this.keyQr,
  });
}

class RedeemPointsEmpty extends RedeemPointsState {}

class RewardsError extends RedeemPointsState {
  final String? error;
  RewardsError({this.error});
}

class RewardsLoading extends RedeemPointsState {}

class RewardsSuccess extends RedeemPointsState {}

class RewardsEmpty extends RedeemPointsState {}
