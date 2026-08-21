import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ridex_mobile_app/src/ui/blocs/authentication/authentication_bloc.dart';

import '../dependency_injection/dependency_injection.dart';
import '../theme/themes/themes_model/theme_bloc/theme_bloc.dart';

/// A widget that initializes and provides multiple BLoCs to its descendants.
///
/// This widget uses [MultiBlocProvider] to provide various BLoCs to the widget tree.
/// Each BLoC is created using the dependency injection system.
class BlocInitializer extends StatelessWidget {
  /// Creates a [BlocInitializer] widget.
  ///
  /// The [child] parameter is the widget below this widget in the tree.
  const BlocInitializer({super.key, required this.child});

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Use MultiBlocProvider to provide multiple BLoCs to the widget tree.
    return MultiBlocProvider(
      // Define the list of BlocProviders.
      providers: [
        BlocProvider(create: (context) => DI.i<ThemeBloc>()),
        BlocProvider(create: (context) => DI.i<AuthenticationBloc>()),
      ],
      // The child widget that will have access to the BLoCs.
      child: child,
    );
  }
}
