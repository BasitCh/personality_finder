// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i56;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i31;

import '../core/global/answers/bloc/save_bloc.dart' as _i26;
import '../core/global/graphql/gql_service.dart' as _i10;
import '../core/global/graphql/gql_service_impl.dart' as _i11;
import '../core/global/interceptors/cache_interceptor.dart' as _i4;
import '../core/global/interceptors/combining_smart_interceptor.dart' as _i55;
import '../core/global/interceptors/network_auth_interceptor.dart' as _i47;
import '../core/global/interceptors/network_error_interceptor.dart' as _i15;
import '../core/global/interceptors/network_log_interceptor.dart' as _i16;
import '../core/global/interceptors/network_refresh_interceptor.dart' as _i54;
import '../core/global/languages/language_bloc.dart' as _i12;
import '../core/global/theming/theme_cubit/theme_cubit.dart' as _i33;
import '../core/global/util/cache/cache_controller.dart' as _i46;
import '../core/global/util/cache/cache_controlling.dart' as _i45;
import '../core/global/util/cache/default_cache_manager.dart' as _i6;
import '../core/global/util/connectivity/connectivity.dart' as _i5;
import '../core/global/util/notifications/local_notifications.dart' as _i13;
import '../core/global/util/notifications/push_notifications.dart' as _i18;
import '../core/global/util/preferences/preferences_storage.dart' as _i30;
import '../core/repository/refresh/refresh_repo.dart' as _i48;
import '../core/repository/refresh/refresh_repository.dart' as _i49;
import '../core/repository/secure_storage/auth/auth_storage.dart' as _i44;
import '../core/repository/secure_storage/auth/auth_storage_impl.dart' as _i43;
import '../core/repository/secure_storage/secure_storage.dart' as _i27;
import '../core/repository/secure_storage/secure_storing.dart' as _i28;
import '../features/feedback/bloc/feedback_bloc.dart' as _i7;
import '../features/feedback/domain/repositories/feedback_repo.dart' as _i8;
import '../features/login/domain/repositories/auth_repo.dart' as _i3;
import '../features/login/presentation/bloc/login_bloc.dart' as _i14;
import '../features/quiz_result/domain/repositories/quiz_result_repo.dart'
    as _i23;
import '../features/quiz_result/presentaion/bloc/submit_result_bloc.dart'
    as _i32;
import '../features/quiz_result_detail/domain/repositories/quiz_result_details_repo.dart'
    as _i22;
import '../features/quiz_result_detail/presentaion/bloc/quiz_result_detail_bloc.dart'
    as _i21;
import '../features/quiz_tasking/domain/repositories/quiz_task_repo.dart'
    as _i20;
import '../features/quiz_tasking/presentation/bloc/quiz_bloc.dart' as _i19;
import '../features/register/presentation/bloc/register_bloc.dart' as _i24;
import '../features/reset_password/presentation/bloc/reset_password_bloc.dart'
    as _i25;
import '../features/settings/presentation/bloc/profile/profile_bloc.dart'
    as _i17;
import '../features/settings/presentation/bloc/settings/settings_bloc.dart'
    as _i29;
import '../features/tip_questions/data/repositories/tip_question_repo.dart'
    as _i50;
import '../features/tip_questions/data/repositories/tip_question_repo_impl.dart'
    as _i51;
import '../features/tip_questions/presentation/bloc/tip_question_bloc.dart'
    as _i36;
import '../features/tip_questions/services/tip_question_service.dart' as _i37;
import '../features/tips/data/repositories/tip_repo.dart' as _i52;
import '../features/tips/data/repositories/tip_repo_impl.dart' as _i53;
import '../features/tips/presentation/blocs/tip_bloc/tip_bloc.dart' as _i34;
import '../features/tips/presentation/blocs/tip_details/tip_details_bloc.dart'
    as _i35;
import '../features/tips/services/tip_service.dart' as _i38;
import '../features/todo/data/todo_repo.dart' as _i59;
import '../features/todo/data/todo_repo_impl.dart' as _i60;
import '../features/todo/presentation/bloc/todo_bloc.dart' as _i39;
import '../features/todo/services/todo_service.dart' as _i57;
import '../features/todo/services/todo_webservice.dart' as _i58;
import '../features/token_refresh/bloc/token_bloc.dart' as _i40;
import '../features/token_refresh/domain/respositories/token_refresh_repo.dart'
    as _i41;
import '../features/upload/presentation/bloc/upload_document_bloc.dart' as _i42;
import 'injectable.dart' as _i61;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AuthRepo>(() => _i3.AuthRepo());
  gh.singleton<_i4.CacheInterceptor>(_i4.CacheInterceptor());
  gh.singleton<_i5.ConnectivityHelper>(registerModule.connectivityHelper());
  gh.factory<_i6.DefaultCacheManager>(() => _i6.DefaultCacheManager());
  gh.lazySingleton<_i7.FeedbackBloc>(() => registerModule.feedbackBloc());
  gh.lazySingleton<_i8.FeedbackRepo>(() => _i8.FeedbackRepo());
  gh.singleton<_i9.FlutterSecureStorage>(registerModule.storage());
  gh.singleton<_i10.GraphQLService>(_i11.GraphQLServiceImpl());
  gh.singleton<_i11.GraphQLServiceImpl>(registerModule.graphQLServiceImpl());
  gh.singleton<_i12.LanguageBloc>(registerModule.languageBloc());
  gh.lazySingleton<_i13.LocalNotfications>(
      () => registerModule.localNotfications());
  gh.lazySingleton<_i14.LoginBloc>(() => registerModule.loginBloc());
  gh.singleton<_i15.NetworkErrorInterceptor>(
      _i15.NetworkErrorInterceptor(get<_i5.ConnectivityHelper>()));
  gh.singleton<_i16.NetworkLogInterceptor>(_i16.NetworkLogInterceptor());
  gh.lazySingleton<_i17.ProfileBloc>(() => registerModule.profileBloc());
  gh.lazySingleton<_i18.PushNotifications>(
      () => registerModule.pushNotifications());
  gh.lazySingleton<_i19.QuizBloc>(() => registerModule.quizBloc());
  gh.lazySingleton<_i20.QuizRepo>(() => _i20.QuizRepo());
  gh.lazySingleton<_i21.QuizResultDetailBloc>(
      () => registerModule.quizResultDetailBloc());
  gh.lazySingleton<_i22.QuizResultDetailRepo>(
      () => _i22.QuizResultDetailRepo());
  gh.lazySingleton<_i23.QuizResultRepo>(() => _i23.QuizResultRepo());
  gh.lazySingleton<_i24.RegisterBloc>(() => registerModule.registerBloc());
  gh.lazySingleton<_i25.ResetPasswordBloc>(
      () => registerModule.resetPasswordBloc());
  gh.lazySingleton<_i26.SaveAnswerBloc>(() => registerModule.saveAnswerBloc());
  gh.singleton<_i27.SecureStorage>(registerModule.secureStorage());
  gh.singleton<_i28.SecureStoring>(
      _i27.SecureStorage(get<_i9.FlutterSecureStorage>()));
  gh.lazySingleton<_i29.SettingsBloc>(() => registerModule.settingsBloc());
  gh.singletonAsync<_i30.SharedPreferenceStorage>(
      () => registerModule.sharedPreferenceStorage());
  await gh.singletonAsync<_i31.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i32.SubmitQuizResultBloc>(
      () => registerModule.submitQuizResultBoc());
  gh.singleton<_i33.ThemeCubit>(registerModule.themeCubit());
  gh.lazySingleton<_i34.TipBloc>(() => registerModule.tipBloc());
  gh.lazySingleton<_i35.TipDetailsBloc>(() => registerModule.tipDetailsBloc());
  gh.lazySingleton<_i36.TipQuestionBloc>(
      () => registerModule.tipQuestionBloc());
  gh.lazySingleton<_i37.TipQuestionService>(() => _i37.TipQuestionService());
  gh.lazySingleton<_i38.TipService>(() => _i38.TipService());
  gh.lazySingleton<_i39.TodoBloc>(() => registerModule.todoBloc());
  gh.lazySingleton<_i40.TokenBloc>(() => registerModule.tokenBloc());
  gh.lazySingleton<_i41.TokenRefreshRepo>(() => _i41.TokenRefreshRepo());
  gh.lazySingleton<_i42.UploadDocumentBloc>(
      () => registerModule.uploadDocumentBloc());
  gh.singleton<_i43.AuthStoring>(_i44.AuthStorage(get<_i28.SecureStoring>()));
  gh.singleton<_i45.CacheControlling>(
      _i46.CacheController(get<_i6.DefaultCacheManager>()));
  gh.singleton<_i47.NetworkAuthInterceptor>(
      _i47.NetworkAuthInterceptor(get<_i43.AuthStoring>()));
  gh.singleton<_i48.RefreshRepo>(
      _i49.RefreshRepository(get<_i43.AuthStoring>()));
  gh.lazySingleton<_i50.TipQuestionRepo>(() => _i51.TipQuestionRepository(
      tipQuestionService: get<_i37.TipQuestionService>()));
  gh.lazySingleton<_i52.TipRepo>(
      () => _i53.TipRepository(get<_i38.TipService>()));
  gh.singleton<_i54.NetworkRefreshInterceptor>(_i54.NetworkRefreshInterceptor(
      get<_i43.AuthStoring>(), get<_i48.RefreshRepo>()));
  gh.singleton<_i55.CombiningSmartInterceptor>(
      registerModule.provideCombiningSmartInterceptor(
          get<_i16.NetworkLogInterceptor>(),
          get<_i47.NetworkAuthInterceptor>(),
          get<_i15.NetworkErrorInterceptor>(),
          get<_i54.NetworkRefreshInterceptor>()));
  gh.singleton<_i56.Dio>(
      registerModule.provideDio(get<_i55.CombiningSmartInterceptor>()));
  gh.singleton<_i57.TodoService>(_i58.TodoWebService(get<_i56.Dio>()),
      registerFor: {_dev, _prod});
  gh.lazySingleton<_i59.TodoRepo>(
      () => _i60.TodoRepository(get<_i57.TodoService>()));
  return get;
}

class _$RegisterModule extends _i61.RegisterModule {}
