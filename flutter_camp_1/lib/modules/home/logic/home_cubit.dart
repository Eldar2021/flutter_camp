import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp_1/core/core.dart';
import 'package:flutter_camp_1/models/models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.remoteClient) : super(const HomeState());

  final RemoteClient remoteClient;

  Future<void> getPost() async {
    final posts = await remoteClient.get();
    if (posts != null) {
      emit(state.copyWith(status: FetchStatus.success, posts: posts));
    } else {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
