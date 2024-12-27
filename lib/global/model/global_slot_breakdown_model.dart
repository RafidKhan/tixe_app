class GlobalSlotBreakdownModel {
  final List<SlotData> slotDataList;

  const GlobalSlotBreakdownModel({
    required this.slotDataList,
  });
}

class SlotData {
  final String? date;
  final String day;
  final String startTime;
  final String endTime;

  const SlotData({
    this.date,
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}
