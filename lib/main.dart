import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmate/presentation/auth/signin/bloc/phone_number_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/home/bloc/cubit/navigation_cubit.dart';
import 'package:workmate/presentation/home/widgets/custom_tab_bar.dart';
import 'package:workmate/presentation/onboarding/bloc/cubit/onboarding_cubit.dart';
import 'package:workmate/presentation/onboarding/pages/splash_page.dart';

void main() {
  runApp(
    // BlocProvider(
    //   create: (context) => OnboardingCubit(),
    //   child:const MyApp() ,
    //   )

    MultiBlocProvider(
      providers: [
     BlocProvider(create: (context) => OnboardingCubit()),
     BlocProvider(create: (context) => NavigationCubit()),
     BlocProvider(create: (context) => SignupCubit()),
     BlocProvider(create: (context) => PhoneNumberCubit()),

    ], child: const MyApp())
    
    );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme
        )

      ),
      home:SplashPage() ,
    );
  }
}