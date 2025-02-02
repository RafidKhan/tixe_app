import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_pdf/controller/my_workout_pdf_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/mixin/global_mixin.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

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
  final controller = MyWorkoutPdfController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() async {
      if (widget.phase.pdfUrl != null) {
        final fullUrl = '${AppUrl.baseStorage.url}${widget.phase.pdfUrl}';
        try {
          ViewUtil.showLoaderPage();
          pdfFile.value = await downloadFile(url: fullUrl);
          ViewUtil.hideLoader();
        } catch (e) {
          ViewUtil.hideLoader();
        }
      }
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
      bottomNavigationBar: GlobalBottomButton(
        onPressed: () {
          controller.completeWorkoutPhase(phase: widget.phase);
        },
        buttonText: context.loc.complete,
      ),
    );
  }
}
