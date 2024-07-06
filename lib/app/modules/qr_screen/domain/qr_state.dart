part of 'qr_cubit.dart';

@immutable
sealed class QrCubitState {}

final class QrCubitInitial extends QrCubitState {}

class SelectedTabBar extends QrCubitState {}

class QRCodeLoading extends QrCubitState {}

class QRCodeError extends QrCubitState {}

class QRCodeSuccess extends QrCubitState {}
