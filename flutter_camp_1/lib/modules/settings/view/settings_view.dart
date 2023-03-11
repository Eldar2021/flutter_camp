import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp_1/app/logic/app_cubit.dart';
import 'package:flutter_camp_1/l10n/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.helloWorld),
      ),
      body: ListView.builder(
        itemCount: AppLocalizations.supportedLocales.length,
        itemBuilder: (BuildContext context, int index) {
          final local = AppLocalizations.supportedLocales[index];
          return Card(
            child: ListTile(
              onTap: () => context.read<AppCubit>().changeLocal(local),
              title: Text(local.languageCode),
            ),
          );
        },
      ),
    );
  }
}
