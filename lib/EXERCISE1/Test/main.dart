import 'package:w5_observer_state/EXERCISE1/Implementation/console_logger.dart';
import 'package:w5_observer_state/EXERCISE1/Model/ride_preference.dart';
import 'package:w5_observer_state/EXERCISE1/Service/w5_observer_state/lib/EXERCISE1/ride_preferences_service.dart';

void main() {
  RidePreferencesService service = RidePreferencesService();
  ConsoleLogger logger = ConsoleLogger();

  service.addListener(logger);

  // Simulate preference selection
  RidePreference preference1 = RidePreference("Economy");
  RidePreference preference2 = RidePreference("Luxury");

  service.selectPreference(preference1);
  service.selectPreference(preference2);
}
