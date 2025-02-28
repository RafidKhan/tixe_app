import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/widget/global_header_widget.dart';

class SleepAndAlarmHeader extends ConsumerWidget {
  const SleepAndAlarmHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const GlobalHeaderWidget(
      title: "Sleep & Alarm",
    );
  }
}
