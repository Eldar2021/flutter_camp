part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState(this.locale);

  final Locale locale;

  @override
  List<Object> get props => [locale];

  AppState copyWith({
    Locale? locale,
  }) {
    return AppState(
      locale ?? this.locale,
    );
  }
}
