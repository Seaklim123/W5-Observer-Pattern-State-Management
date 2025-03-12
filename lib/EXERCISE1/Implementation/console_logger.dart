import 'package:w5_observer_state/EXERCISE1/Model/ride_preference.dart';
import 'package:w5_observer_state/EXERCISE1/ride_preferences_listener.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print("ConsoleLogger: Preference changed to ${selectedPreference.name}");
  }
}
