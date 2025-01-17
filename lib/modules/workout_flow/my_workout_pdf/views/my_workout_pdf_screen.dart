import 'dart:io';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/mixin/global_mixin.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyWorkoutPdfScreen extends StatefulWidget {
  final WorkoutPhase phase;

  const MyWorkoutPdfScreen({
    super.key,
    required this.phase,
  });

  @override
  State<MyWorkoutPdfScreen> createState() => _MyWorkoutPdfScreenState();
}

class _MyWorkoutPdfScreenState extends State<MyWorkoutPdfScreen>
    with GlobalMixin {
  final ValueNotifier<File?> pdfFile = ValueNotifier(null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() async {
      pdfFile.value = await downloadFile(url: widget.phase.pdfUrl ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          GlobalHeaderWidget(
            title: widget.phase.title ?? "",
          ),
          if (widget.phase.pdfUrl != null) ...[
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: pdfFile,
                builder: (context, data, child) {
                  if (data != null) {
                    return PDFView(
                      filePath: data.path,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            )
          ]
        ],
      ),
    );
  }
}
