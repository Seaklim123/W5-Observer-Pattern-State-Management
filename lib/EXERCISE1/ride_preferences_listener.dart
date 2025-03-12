import 'package:w5_observer_state/EXERCISE1/Model/ride_preference.dart';

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}