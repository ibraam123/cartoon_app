part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileChangeIcon extends ProfileState{
  final String newIcon;

  ProfileChangeIcon(this.newIcon);
}

final class ProfileChangeName extends ProfileState{
  final String newName;

  ProfileChangeName(this.newName);
}

