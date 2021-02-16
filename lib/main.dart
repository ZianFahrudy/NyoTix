import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotixx/bloc/bloc.dart';
import 'package:gotixx/bloc/page_bloc.dart';
import 'package:gotixx/bloc/theme_bloc.dart';
import 'package:gotixx/services/services.dart';
import 'package:gotixx/ui/pages/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => PageBloc()),
          BlocProvider(create: (ctx) => UserBloc()),
          BlocProvider(
            create: (ctx) => ThemeBloc(),
          ),
          BlocProvider(create: (ctx) => MovieBloc()..add(FetchMovie())),
          BlocProvider(create: (ctx) => TicketBloc())
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (ctx, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          ),
        ),
      ),
    );
  }
}
