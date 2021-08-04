import 'account_services.swagger.dart';
import 'administrator.swagger.dart';
import 'exports.swagger.dart';
import 'home.swagger.dart';
import 'mobile.swagger.dart';
import 'plugins.swagger.dart';
import 'reports.swagger.dart';
import 'settings.swagger.dart';
import 'utilities.swagger.dart';

final Map<Type, Object Function(Map<String, dynamic>)> generatedMapping = {
  ...HomeJsonDecoderMappings,
  ...MobileJsonDecoderMappings,
  ...ExportsJsonDecoderMappings,
  ...AccountServicesJsonDecoderMappings,
  ...ReportsJsonDecoderMappings,
  ...SettingsJsonDecoderMappings,
  ...PluginsJsonDecoderMappings,
  ...AdministratorJsonDecoderMappings,
  ...UtilitiesJsonDecoderMappings,
};
