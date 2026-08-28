import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/app_localizations.dart';
import 'configs/app/screen_config.dart';
import 'configs/bloc/bloc_initializer.dart';
import 'configs/dependency_injection/dependency_injection.dart';
import 'configs/dependency_injection/navigation_service.dart';
import 'configs/router/responsive_framework_helper.dart';
import 'configs/router/route_animation.dart';
import 'configs/router/routes.dart';
import 'configs/theme/theme_config.dart';
import 'configs/theme/themes/themes_view_model/theme_bloc_builder_wrapper.dart';
import 'configs/theme/themes/themes_view_model/theme_bloc_helper.dart';
import 'ui/generics/widgets/focus_handler/focus_handle_wrapper.dart';
import 'ui/generics/widgets/route/conditional_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    final AppThemeConfig appThemeConfig = AppThemeConfig();
    final ResponsiveFrameworkHelper responsiveFrameworkHelper =
    ResponsiveFrameworkHelper();

    return BlocInitializer(
      child: FocusHandler(
        child: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1)),
          child: ScreenUtilInit(
            designSize: Size(
              ScreenConfig.screenSizeWidth,
              ScreenConfig.screenSizeHeight,
            ),
            builder: (context, _) => ThemeBuilderWrapper(
              child: MaterialApp(
                localizationsDelegates:
                AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                navigatorKey: DI.i<NavigationService>().navigationKey,
                debugShowCheckedModeBanner: false,
                theme: appThemeConfig.getThemeData(
                  ThemeBlocHelper.getCurrentThemeFlavor(context),
                ),
                builder: (context, child) => responsiveFrameworkHelper
                    .responsiveBreakpointsBuilder(child!),
                initialRoute: CustomRouter.splashScreenRouteName,
                onGenerateRoute: (RouteSettings settings) {
                  return Routes.fadeThrough(settings, (context) {
                    return ConditionalRouteWidget(
                      builder: (context, child) => responsiveFrameworkHelper
                          .responsiveFrameworkMaxWidthBox(context, child!),
                      routes: CustomRouter.routes.keys.toList(),
                      child: CustomRouter.buildWidget(
                        settings.name,
                        settings.arguments,
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}