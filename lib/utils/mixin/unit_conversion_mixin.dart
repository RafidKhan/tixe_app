mixin UniConversionMixin{
  String convertToCm(String height, String unit) {
    final numHeight = num.tryParse(height)??0;
    if (unit == "inches") {
      return (numHeight * 2.54).round().toString(); // Convert inches to cm
    }
    return numHeight.toString(); // If unit is cm, keep it as is
  }

  String convertToKm(String distance, String unit) {
    final numDistance = num.tryParse(distance)??0;
    if (unit == "miles") {
      return (numDistance * 1.60934).round().toString(); // Convert miles to km
    }
    return numDistance.toString(); // If unit is km, keep it as is
  }

  String convertToKg(String weight, String unit) {
    final numWeight = num.tryParse(weight)??0;
    if (unit == "lbs") {
      return (numWeight / 2.20462).round().toString(); // Convert lbs to kg
    }
    return numWeight.toString(); // If unit is kg, keep it as is
  }

  String convertHeightToPreferredUnit(String heightInCm, String preferredUnit) {
    final numHeightInCm = num.tryParse(heightInCm)??0;
    if (preferredUnit == "inches") {
      return (numHeightInCm / 2.54).round().toString(); // Convert cm to inches
    }
    return numHeightInCm.toString(); // If preferred unit is cm, keep it as is
  }

  String convertDistanceToPreferredUnit(String distanceInKm, String preferredUnit) {
    final numDistanceInKm = num.tryParse(distanceInKm)??0;
    if (preferredUnit == "miles") {
      return (numDistanceInKm / 1.60934).round().toString(); // Convert km to miles
    }
    return numDistanceInKm.toString(); // If preferred unit is km, keep it as is
  }

  String convertWeightToPreferredUnit(String weightInKg, String preferredUnit) {
    final numWeightInKg = num.tryParse(weightInKg)??0;

    if (preferredUnit == "lbs") {
      return (numWeightInKg * 2.20462).round().toString(); // Convert kg to lbs
    }
    return numWeightInKg.toString(); // If preferred unit is kg, keep it as is
  }



}