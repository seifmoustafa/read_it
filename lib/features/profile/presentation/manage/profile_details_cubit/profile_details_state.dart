part of 'profile_details_cubit.dart';

abstract class ProfileDetailsState extends Equatable {
  const ProfileDetailsState();

  @override
  List<Object> get props => [];
}

class ProfileDetailsInitial extends ProfileDetailsState {}

class ProfiledetailsLoading extends ProfileDetailsState {}

class ProfileDetailSuccess extends ProfileDetailsState {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  ProfileDetailSuccess(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});

  @override
  List<Object> get props => [firstName, lastName, phoneNumber];
}

class ProfileDetailsFailure extends ProfileDetailsState {
  final String errMessage;

  const ProfileDetailsFailure(this.errMessage);
}
