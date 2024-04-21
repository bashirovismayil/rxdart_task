import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart_project/color_cubit.dart';
import 'package:rxdart_project/counter_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
          BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RxDart Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) => Text('number: $state'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ColorCubit, Color>(
              builder: (context, state) => Icon(Icons.favorite, color: state),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<ColorCubit>().changeColor(),
              child: const Text('Change color'),
            ),
          ],
        ),
      ),
    );
  }
}
