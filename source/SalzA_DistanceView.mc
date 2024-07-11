import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

class SalzA_Distance {
  function distance_function(salzA_distance_meters, salzA_time_seconds) {
    if (salzA_distance_meters < 1000) {
      return salzA_distance_meters + " m"; 
    } else if (salzA_distance_meters >= 1000) {
      var kilometers = salzA_distance_meters / 1000;
      return kilometers.format("%.1f") + " km";
    } else {
      return "--";
    }
  }
}

class SalzA_DistanceView extends WatchUi.SimpleDataField {
  function initialize() {
    SimpleDataField.initialize();
    label = "VZDÁL. DO LIM.";
  }

  function compute(info) {
    var distance = new SalzA_Distance();
    var func = distance.method( : distance_function);
    return limitLogic(info, func);
  }
}