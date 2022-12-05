// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/core/database/hive_setup.dart';
import 'package:morphosis_template/core/global/answers/bloc/save_bloc.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/core/global/interceptors/cache_interceptor.dart';
import 'package:morphosis_template/core/global/interceptors/combining_smart_interceptor.dart';
import 'package:morphosis_template/core/global/interceptors/network_auth_interceptor.dart';
import 'package:morphosis_template/core/global/interceptors/network_error_interceptor.dart';
import 'package:morphosis_template/core/global/interceptors/network_log_interceptor.dart';
import 'package:morphosis_template/core/global/interceptors/network_refresh_interceptor.dart';
import 'package:morphosis_template/core/global/languages/language_bloc.dart';
import 'package:morphosis_template/core/global/theming/theme_cubit/theme_cubit.dart';
import 'package:morphosis_template/core/global/util/connectivity/connectivity.dart';
import 'package:morphosis_template/core/global/util/crashlytics/crashlytics.dart';
import 'package:morphosis_template/core/global/util/env/flavor_config.dart';
import 'package:morphosis_template/core/global/util/environment/os_info.dart';
import 'package:morphosis_template/core/global/util/notifications/local_notifications.dart';
import 'package:morphosis_template/core/global/util/notifications/push_notifications.dart';
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart';
import 'package:morphosis_template/core/repository/secure_storage/secure_storage.dart';
import 'package:morphosis_template/di/injectable.config.dart';
import 'package:morphosis_template/features/feedback/bloc/feedback_bloc.dart';
import 'package:morphosis_template/features/feedback/domain/repositories/feedback_repo.dart';
import 'package:morphosis_template/features/login/domain/repositories/auth_repo.dart';
import 'package:morphosis_template/features/login/presentation/bloc/login_bloc.dart';
import 'package:morphosis_template/features/quiz_result/domain/repositories/quiz_result_repo.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/bloc/submit_result_bloc.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/repositories/quiz_result_details_repo.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/bloc/quiz_result_detail_bloc.dart';
import 'package:morphosis_template/features/quiz_tasking/domain/repositories/quiz_task_repo.dart';
import 'package:morphosis_template/features/quiz_tasking/presentation/bloc/quiz_bloc.dart';
import 'package:morphosis_template/features/register/presentation/bloc/register_bloc.dart';
import 'package:morphosis_template/features/reset_password/presentation/bloc/reset_password_bloc.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/profile/profile_bloc.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/settings/settings_bloc.dart';
import 'package:morphosis_template/features/tip_questions/data/repositories/tip_question_repo.dart';
import 'package:morphosis_template/features/tip_questions/presentation/bloc/tip_question_bloc.dart';
import 'package:morphosis_template/features/tips/data/repositories/tip_repo.dart';
import 'package:morphosis_template/features/tips/presentation/blocs/tip_bloc/tip_bloc.dart';
import 'package:morphosis_template/features/tips/presentation/blocs/tip_details/tip_details_bloc.dart';
import 'package:morphosis_template/features/todo/data/todo_repo.dart';
import 'package:morphosis_template/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:morphosis_template/features/token_refresh/bloc/token_bloc.dart';
import 'package:morphosis_template/features/token_refresh/domain/respositories/token_refresh_repo.dart';
import 'package:morphosis_template/features/upload/presentation/bloc/upload_document_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../core/database/hive_setup.dart';
import '../core/global/graphql/gql_service_impl.dart';
import '../core/global/interceptors/cache_interceptor.dart';
import '../core/global/interceptors/combining_smart_interceptor.dart';
import '../core/global/interceptors/network_auth_interceptor.dart';
import '../core/global/interceptors/network_error_interceptor.dart';
import '../core/global/interceptors/network_log_interceptor.dart';
import '../core/global/interceptors/network_refresh_interceptor.dart';
import '../core/global/languages/language_bloc.dart';
import '../core/global/theming/theme_cubit/theme_cubit.dart';
import '../core/global/util/connectivity/connectivity.dart';
import '../core/global/util/crashlytics/crashlytics.dart';
import '../core/global/util/env/flavor_config.dart';
import '../core/global/util/environment/os_info.dart';
import '../core/global/util/notifications/push_notifications.dart';
import '../core/global/util/preferences/preferences_storage.dart';
import '../core/repository/secure_storage/secure_storage.dart';
import '../features/login/domain/repositories/auth_repo.dart';
import '../features/login/presentation/bloc/login_bloc.dart';
import '../features/quiz_tasking/domain/repositories/quiz_task_repo.dart';
import '../features/quiz_tasking/presentation/bloc/quiz_bloc.dart';
import '../features/register/presentation/bloc/register_bloc.dart';
import '../features/reset_password/presentation/bloc/reset_password_bloc.dart';
import '../features/settings/presentation/bloc/profile/profile_bloc.dart';
import '../features/settings/presentation/bloc/settings/settings_bloc.dart';
import '../features/todo/data/todo_repo.dart';
import '../features/todo/presentation/bloc/todo_bloc.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: avoid_print
  print('Using environment: $environment');
  await HiveSetup.initHive;
  await OsInfo.init();
  await Firebase.initializeApp();
  await LocalNotfications().initialize();
  await Crashlytics.initialize();
  await initHiveForFlutter();
  await $initGetIt(getIt, environment: environment);

  await getIt.allReady();
}

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<SharedPreferences> prefs() {
    if (FlavorConfig.isInTest()) {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues(<String, Object>{});
    }
    return SharedPreferences.getInstance();
  }

  @singleton
  Future<SharedPreferenceStorage> sharedPreferenceStorage() async {
    final sPrefs = await prefs();
    return SharedPreferenceStorage(sPrefs);
  }

  @singleton
  FlutterSecureStorage storage() => const FlutterSecureStorage();

  @singleton
  SecureStorage secureStorage() => SecureStorage(storage());

  @singleton
  GraphQLServiceImpl graphQLServiceImpl() => GraphQLServiceImpl()..client();

  // @singleton
  // GraphQLServiceImpl graphQLServiceImplClient() =>
  //     GraphQLServiceImpl()..client();

  @singleton
  ConnectivityHelper connectivityHelper() => ConnectivityHelper();

  @singleton
  CombiningSmartInterceptor provideCombiningSmartInterceptor(
    NetworkLogInterceptor logInterceptor,
    NetworkAuthInterceptor authInterceptor,
    NetworkErrorInterceptor errorInterceptor,
    NetworkRefreshInterceptor refreshInterceptor,
  ) =>
      CombiningSmartInterceptor()
        ..addInterceptor(authInterceptor)
        ..addInterceptor(refreshInterceptor)
        ..addInterceptor(errorInterceptor)
        ..addInterceptor(logInterceptor);

  @singleton
  Dio provideDio(CombiningSmartInterceptor interceptor) {
    final dio = Dio(
      BaseOptions(baseUrl: FlavorConfig.instance.values.baseUrl),
    );
    // ignore: avoid_as
    (dio.transformer as DefaultTransformer).jsonDecodeCallback =
        parseJson; // ignore: avoid_as
    dio.interceptors
      ..add(interceptor)
      ..add(getIt<CacheInterceptor>());
    return dio;
  }

  //register blocs
  @singleton
  ThemeCubit themeCubit() => ThemeCubit();

  @lazySingleton
  LocalNotfications localNotfications() => LocalNotfications();

  @lazySingleton
  UploadDocumentBloc uploadDocumentBloc() => UploadDocumentBloc();

  @singleton
  LanguageBloc languageBloc() => LanguageBloc();

  @lazySingleton
  TodoBloc todoBloc() => TodoBloc(todoRepository: getIt<TodoRepo>());

  @lazySingleton
  LoginBloc loginBloc() => LoginBloc(authRepo: getIt<AuthRepo>());

  @lazySingleton
  TokenBloc tokenBloc() =>
      TokenBloc(tokenRefreshRepo: getIt<TokenRefreshRepo>());

  @lazySingleton
  RegisterBloc registerBloc() => RegisterBloc(authRepo: getIt<AuthRepo>());

  @lazySingleton
  ResetPasswordBloc resetPasswordBloc() =>
      ResetPasswordBloc(authRepo: getIt<AuthRepo>());

  @lazySingleton
  SettingsBloc settingsBloc() => SettingsBloc(authRepo: getIt<AuthRepo>());

  @lazySingleton
  ProfileBloc profileBloc() => ProfileBloc(authRepo: getIt<AuthRepo>());

  @lazySingleton
  PushNotifications pushNotifications() => PushNotifications();

  @lazySingleton
  QuizBloc quizBloc() => QuizBloc(quizRepo: getIt<QuizRepo>());

  @lazySingleton
  SubmitQuizResultBloc submitQuizResultBoc() =>
      SubmitQuizResultBloc(quizResultRepo: getIt<QuizResultRepo>());

  @lazySingleton
  QuizResultDetailBloc quizResultDetailBloc() =>
      QuizResultDetailBloc(quizResultDetailRepo: getIt<QuizResultDetailRepo>());

  @lazySingleton
  SaveAnswerBloc saveAnswerBloc() => SaveAnswerBloc();

  @lazySingleton
  TipBloc tipBloc() => TipBloc(tipRepo: getIt<TipRepo>());

  @lazySingleton
  TipDetailsBloc tipDetailsBloc() => TipDetailsBloc(tipRepo: getIt<TipRepo>());

  @lazySingleton
  TipQuestionBloc tipQuestionBloc() =>
      TipQuestionBloc(tipQuestionRepo: getIt<TipQuestionRepo>());

  @lazySingleton
  FeedbackBloc feedbackBloc() =>
      FeedbackBloc(feedbackRepo: getIt<FeedbackRepo>());
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) =>
    compute<String, dynamic>(_parseAndDecode, text);
