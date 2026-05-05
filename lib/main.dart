import 'dart:io';

import '/bloc/pic%20bloc/image_picker_bloc.dart';
import '/bloc/pic%20bloc/image_picker_event.dart';
import '/bloc/pic%20bloc/image_picker_states.dart';
import '/bloc/switch_bloc.dart';
import '/bloc/theme%20bloc/theme_events.dart';
import '/bloc/theme%20bloc/theme_states.dart';
import '/utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/theme bloc/theme_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImageUtil.instance)),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: StartupApp(),
          );
        },
      ),
    );
  }
}

developDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Pick Image from?'),
        content: SizedBox(
          height: 100,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<ImagePickerBloc>().add(PickImageFromGallery());
                },
                child: Text('Gallery'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<ImagePickerBloc>().add(PickImageFromCamera());
                },
                child: Text('Camera'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class StartupApp extends StatelessWidget {
  const StartupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: .spaceAround,
            spacing: 10,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(SystemThemeEvent());
                },
                child: Icon(Icons.system_security_update),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(DarkThemeEvent());
                },
                child: Icon(Icons.dark_mode),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(LightThemeEvent());
                },
                child: Icon(Icons.light_mode),
              ),
            ],
          ),
        ],
        title: Text('Flutter Bloc'),
      ),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          // Padding(
          //   padding: .all(8.0),
          //   child: Row(
          //     // spacing: 10,
          //     mainAxisAlignment: .spaceBetween,
          //     children: [
          //       Text('Notifications', style: TextStyle(fontSize: 25)),
          //       BlocBuilder<SwitchBloc, SwitchState>(
          //         builder: (context, state) {
          //           return Switch(
          //             value: state.isON,
          //             onChanged: (value) {
          //               print(value);
          //               context.read<SwitchBloc>().add(SwitchEventON());
          //             },
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 12),
          // BlocBuilder<SwitchBloc, SwitchState>(
          //   builder: (context, state) {
          //     return Container(
          //       height: 150,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: Colors.red.withValues(alpha: state.sliderValue),
          //       ),
          //     );
          //   },
          // ),
          // SizedBox(height: 12),

          // BlocBuilder<SwitchBloc, SwitchState>(
          //   builder: (context, state) {
          //     return Slider(
          //       value: state.sliderValue,
          //       onChanged: (value) {
          //         context.read<SwitchBloc>().add(
          //           SliderEvent(slideValue: value),
          //         );
          //       },
          //     );
          //   },
          // ),
          // BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          //   builder: (context, state) {
          //     return;
          //   },
          // ),
          // BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          //   builder: (context, state) {
          //     return SizedBox(
          //       height: 100,
          //       child:
          //     );
          //   },
          // ),
          Center(
            child: ElevatedButton(
              onPressed: () => developDialog(context),
              child: Text('Pick Image'),
            ),
          ),
          SizedBox(height: 10),
          BlocBuilder<ImagePickerBloc, ImagePickerStates>(
            builder: (context, state) {
              if (state.pickedFile != null) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.file(File(state.pickedFile!.path.toString())),
                );
              } else if (state.pickedFile == null) {
                return GestureDetector(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(PickImageFromCamera());
                  },
                  child: const Icon(Icons.camera),
                );
              }
              // Fixed: Added a return for when neither condition is met
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
