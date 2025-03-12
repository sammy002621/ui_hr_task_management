import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmate/presentation/auth/signin/bloc/phone_number_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_cubit.dart';
import 'package:workmate/presentation/auth/signup/bloc/user_cubit.dart';
import 'package:workmate/presentation/auth/signup/bloc/user_state.dart';
import 'package:workmate/presentation/home/bloc/cubit/navigation_cubit.dart';
import 'package:workmate/presentation/home/pages/main_home_screen.dart';
import 'package:workmate/presentation/onboarding/bloc/cubit/onboarding_cubit.dart';
import 'package:workmate/presentation/onboarding/pages/splash_page.dart';
import 'package:workmate/service_locator.dart';

void main() async {
  //TODO: make sure that if there is an already logged in user we will go to the home page if not we will go to the onboarding page
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await initializeDependencies();
  final userCubit = UserCubit();
  await userCubit.loadUserFromPreferences();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => userCubit),
    BlocProvider(create: (context) => OnboardingCubit()),
    BlocProvider(create: (context) => NavigationCubit()),
    BlocProvider(create: (context) => SignupCubit()),
    BlocProvider(create: (context) => PhoneNumberCubit()),
    BlocProvider(create: (context) => TextFormCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
      // according to the state of user we will navigate to the home page or the onboarding page
      // if we have user credentials in our cubit then go to the home page if not go to the onboarding page
      home: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state.token.isNotEmpty) {
          print("token is : ${state.token}");
          return MainHomeScreen();
        } else {
          print("no token is : ${state.token}");
          return SplashPage();
        }
      }),
    );
  }
}
