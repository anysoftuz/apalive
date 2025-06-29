import 'package:apalive/assets/constants/storage_keys.dart';
import 'package:apalive/data/models/auth/user_model.dart';
import 'package:apalive/infrastructure/repo/auth_repo.dart';
import 'package:apalive/infrastructure/repo/storage_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading,
}

Future<bool> isInternetConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet) ||
      connectivityResult.contains(ConnectivityResult.vpn) ||
      connectivityResult.contains(ConnectivityResult.bluetooth) &&
          await InternetConnectionChecker.instance.hasConnection) {
    return true; // Connected to mobile data or Wi-Fi
  } else {
    return false; // Not connected to the internet
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repo;
  AuthBloc(this._repo) : super(AuthState()) {
    on<CheckUserEvent>((event, emit) {
      final token = StorageRepository.getString(StorageKeys.TOKEN);
      if (token.isEmpty) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      } else {
        add(GetMeEvent());
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(statusSms: FormzSubmissionStatus.inProgress));
      final response = await _repo.login({
        "username": event.username,
        "password": event.password,
      });
      if (response.isRight) {
        emit(
          state.copyWith(
            userModel: response.right.data,
            status: AuthenticationStatus.authenticated,
            statusSms: FormzSubmissionStatus.success,
          ),
        );
      } else {
        event.onError();
        emit(
          state.copyWith(
            status: AuthenticationStatus.unauthenticated,
            statusSms: FormzSubmissionStatus.failure,
          ),
        );
      }
    });

    on<GetMeEvent>((event, emit) async {
      emit(state.copyWith(statusSms: FormzSubmissionStatus.inProgress));
      final response = await _repo.getMe();
      if (response.isRight) {
        emit(
          state.copyWith(
            userModel: response.right.data.first,
            status: AuthenticationStatus.authenticated,
            statusSms: FormzSubmissionStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthenticationStatus.unauthenticated,
            statusSms: FormzSubmissionStatus.failure,
          ),
        );
      }
    });

    on<LogOutEvent>((event, emit) async {
      emit(state.copyWith(statusSms: FormzSubmissionStatus.inProgress));
      await StorageRepository.putString(StorageKeys.TOKEN, "");
      await StorageRepository.putString(StorageKeys.REFRESH, "");
      await StorageRepository.putBool(StorageKeys.LENDING, true);
      emit(
        state.copyWith(
          statusSms: FormzSubmissionStatus.success,
          status: AuthenticationStatus.unauthenticated,
          userModel: const UserModel(),
        ),
      );
    });
  }
}
