part of 'profile_image_cubit.dart';

abstract class ProfileimageState extends Equatable {
  const ProfileimageState();

  @override
  List<Object> get props => [];
}

class ProfileimageInitial extends ProfileimageState {}

class ProfileimageLoading extends ProfileimageState {}

class ProfileimagePicked extends ProfileimageState {
  final File imageFile;

  const ProfileimagePicked(this.imageFile);
}

class ProfileimageUploaded extends ProfileimageState {
  final String imageUrl;

  const ProfileimageUploaded(this.imageUrl);
}

class ProfileimageFailure extends ProfileimageState {
  final String errMessage;

  const ProfileimageFailure(this.errMessage);
}
