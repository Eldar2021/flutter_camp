// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = FetchStatus.loading,
    this.posts,
  });

  final FetchStatus status;
  final List<Post>? posts;

  @override
  List<Object?> get props => [status];

  HomeState copyWith({FetchStatus? status, List<Post>? posts}) {
    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }
}
