import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/ui/blocs/authentication/authentication_bloc.dart';
import 'package:ridex_mobile_app/src/ui/blocs/driverDetails/driver_details_bloc.dart';
import '../../ui/resources/driverDetail/driver_detail_provider.dart';
import '../../ui/resources/driverDetail/driver_detail_repository.dart';
import '../theme/themes/themes_model/theme_bloc/theme_bloc.dart';
import 'navigation_service.dart';

class DI {
  static GetIt i = GetIt.I;

  static void init() {
    // 1. Navigation & Theme Services
    i.registerLazySingleton(() => NavigationService());
    i.registerLazySingleton(() => ThemeBloc());

    // 2. External Dependencies
    i.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

    // 3. Providers
    i.registerLazySingleton<DriverProvider>(
          () => DriverProvider(i<SupabaseClient>()),
    );

    // 4. Repositories
    i.registerLazySingleton<DriverRepository>(
          () => DriverRepository(i<DriverProvider>()),
    );

    // 5. BLoCs
    i.registerLazySingleton(() => AuthenticationBloc());

    // Pass registered Repository & SupabaseClient to DriverDetailsBloc
    i.registerFactory(
          () => DriverDetailsBloc(i<DriverRepository>(), i<SupabaseClient>()),
    );
  }
}