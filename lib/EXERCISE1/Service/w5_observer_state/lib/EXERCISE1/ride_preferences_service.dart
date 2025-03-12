
import 'package:w5_observer_state/EXERCISE1/Model/ride_preference.dart';
import 'package:w5_observer_state/EXERCISE1/ride_preferences_listener.dart';

class RidePreferencesService {
  List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void removeListener(RidePreferencesListener listener) {
    _listeners.remove(listener);
  }

  void notifyListeners(RidePreference selectedPreference) {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(selectedPreference);
    }
  }

  void selectPreference(RidePreference preference) {
    print("Preference selected: ${preference.name}");
    notifyListeners(preference);
  }
}

