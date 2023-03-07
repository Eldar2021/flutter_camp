import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp_1/core/core.dart';
import 'package:flutter_camp_1/l10n/l10n.dart';
import 'package:flutter_camp_1/models/models.dart';
import 'package:flutter_camp_1/modules/home/home.dart';
import 'package:http/http.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteClient(Client())),
      child: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<HomeCubit>().getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.helloWorld),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case FetchStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FetchStatus.error:
              return const Center(
                child: Text('Error'),
              );
            case FetchStatus.success:
              return PostListWidget(state.posts ?? []);
          }
        },
      ),
    );
  }
}

class PostListWidget extends StatelessWidget {
  const PostListWidget(this.posts, {super.key});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return Card(
          child: ListTile(
            minLeadingWidth: 8.0,
            leading: Text('${post.id}'),
            title: Text(post.title),
            subtitle: Text(post.body),
          ),
        );
      },
    );
  }
}
