import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/services/navigation_service.dart';
import 'package:tech_task/core/services/snackbar_services.dart';

mixin UIToolMixin {
  final NavigationService navigationService = locator<NavigationService>();
  final SnackBarService snackBarService = locator<SnackBarService>();
}
