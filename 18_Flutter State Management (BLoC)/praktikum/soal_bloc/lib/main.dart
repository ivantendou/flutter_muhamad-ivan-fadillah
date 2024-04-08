import 'package:flutter/material.dart';
import 'utils/constant/route_paths_cosntant.dart';
import 'pages/page_barrel.dart';
import 'bloc/bloc_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CrudContactBloc>(
          create: (context) => CrudContactBloc(),
        ),
        BlocProvider<DatePickerBloc>(
          create: (context) => DatePickerBloc(),
        ),
        BlocProvider<ColorPickerBloc>(
          create: (context) => ColorPickerBloc(),
        ),
        BlocProvider<FilePickerBloc>(
          create: (context) => FilePickerBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Contact App',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        routes: {
          RoutePaths.contact: (context) => const ContactPage(),
          RoutePaths.gallery: (context) => const GalleryPage(),
          RoutePaths.detailImage: (context) => const DetailImagePage(),
        },
      ),
    );
  }
}
