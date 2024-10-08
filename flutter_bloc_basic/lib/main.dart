import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_basic/bloc/switch_button_bloc/switch_bloc.dart';
import 'package:flutter_bloc_basic/ui/image_picker/image_picker_screen.dart';
import 'package:flutter_bloc_basic/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const ImagePickerScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void equitableFunction() {
    Person person1 = const Person(name: "Yash", age: 21);
    Person person2 = const Person(name: "Yash", age: 21);

    print(person1.hashCode.toString());
    print(person2.hashCode.toString());

    print(person1 == person2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Equatable Function working',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: equitableFunction,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  // @override
  // bool operator ==(Object other) {
  //   return identical(this, other) ||
  //       other is Person &&
  //           runtimeType == other.runtimeType &&
  //           name == other.name &&
  //           age == other.age;
  // }

  // @override
  // int get hashCode => name.hashCode ^ age.hashCode;

  @override
  List<Object?> get props => [name, age];
}
