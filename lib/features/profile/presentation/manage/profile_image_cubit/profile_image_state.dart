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
