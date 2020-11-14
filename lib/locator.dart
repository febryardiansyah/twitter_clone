import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/bloc/auth_bloc/auth_bloc.dart';
import 'package:twitter_clone/bloc/register_bloc/register_bloc.dart';
import 'package:twitter_clone/repositories/auth_repository.dart';
import 'package:twitter_clone/repositories/post_tweet_repo.dart';

import 'helpers/connectivity_check.dart';

final getIt = GetIt.instance;

Future <void> init()async{
  //Repositories
  getIt.registerLazySingleton(() => AuthRepository());
  getIt.registerLazySingleton(() => PostTweetRepo());

  //internet checker
  getIt.registerLazySingleton(() => ConnectivityCheck());

  //local database
  final _sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => _sharedPrefs);

  // blocs
  getIt.registerFactory(() => AuthBloc());
  getIt.registerFactory(() => RegisterBloc());
}