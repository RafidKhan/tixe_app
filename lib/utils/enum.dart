enum LanguageOption {
  Bangla,
  English,
}

enum Method {
  POST,
  GET,
  PUT,
  DELETE,
  PATCH,
  DOWNLOAD,
}

enum UrlLink {
  isLive,
  isDev,
  isLocalServer,
}

enum ImageFor {
  asset,
  network,
  file,
}

enum SvgFor {
  asset,
  network,
}

enum ServiceType {
  Training,
  Workout,
  Fitness,
  Undefined,
}

enum ScheduleType {
  DateBased,
  DurationBased,
  Undefined,
}

enum TimerType {
  NOT_STARTED,
  PLAY,
  PAUSE,
  STOP,
  COMPLETE,
}

enum HeartRateStatus {
  low, // Heart rate is below normal range
  normal, // Heart rate is within normal range
  high, // Heart rate is above normal range
}

enum AlarmType {
  MORNING,
  NIGHT,
  CUSTOM,
}
