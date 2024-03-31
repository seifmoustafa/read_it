part of 'profile_image_cubit.dart';

abstract class ProfileImageState extends Equatable {
  const ProfileImageState();

  @override
  List<Object> get props => [];
}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageLoading extends ProfileImageState {}

class ProfileImagePicked extends ProfileImageState {
  final File imageFile;

  const ProfileImagePicked(this.imageFile);
}

class ProfileImageUploaded extends ProfileImageState {
  final String imageUrl;

  const ProfileImageUploaded(this.imageUrl);
}

class ProfileImageFailure extends ProfileImageState {
  final String errMessage;

  const ProfileImageFailure(this.errMessage);
}

class SignOutSuccess extends ProfileImageState {}

class SignOutLoading extends ProfileImageState {}

class SignOutFailure extends ProfileImageState {
  final String errMessage;

  const SignOutFailure(this.errMessage);
}
