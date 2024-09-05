import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver/dio/cubit/cubit.dart';
import 'package:sliver/dio/cubit/state.dart';
import 'package:sliver/dio/dio.dart';
import 'package:sliver/dio/model.dart';

class DioScreen extends StatelessWidget {
  const DioScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DioCubit(service: Services())..get(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Data List')),
          body: BlocBuilder<DioCubit, DioState>(
            builder: (context, state) {
              if (state.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.message != null) {
                return Center(child: Text(state.message!));
              } else if (state.list.isEmpty) {
                return const Center(child: Text('No data available.'));
              } else {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    Model item = state.list[index];
                    return ListTile(
                      title: Text(item.title ?? ''),
                      subtitle: Text('Completed: ${item.completed}'),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
