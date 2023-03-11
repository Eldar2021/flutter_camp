import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp_1/app/app.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.appService) : super(AppState(appService.init()));

  final AppService appService;

  Future<void> changeLocal(Locale local) async {
    await appService.cacheLocalCode(local.languageCode);
    emit(state.copyWith(locale: local));
  }
}
