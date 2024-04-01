part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileImageLoading extends ProfileState {}

class ProfileImagePicked extends ProfileState {
  final File imageFile;

  const ProfileImagePicked(this.imageFile);
}

class ProfileImageUploaded extends ProfileState {
  final String imageUrl;

  const ProfileImageUploaded(this.imageUrl);
}

class ProfileImageFailure extends ProfileState {
  final String errMessage;

  const ProfileImageFailure(this.errMessage);
}

class SignOutSuccess extends ProfileState {}

class SignOutLoading extends ProfileState {}

class SignOutFailure extends ProfileState {
  final String errMessage;

  const SignOutFailure(this.errMessage);
}

class FavouriteItem extends ProfileState {
  final String bookId;

  const FavouriteItem(this.bookId);
}
