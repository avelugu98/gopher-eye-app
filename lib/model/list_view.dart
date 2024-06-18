import 'package:gopher_eye/model/diagnosis_list_model.dart';
import 'package:flutter/material.dart';

class DiagnosisListView extends StatelessWidget {
  const DiagnosisListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DiagnosisCard(
          date: '11 June',
          status: 'incomplete',
          assetName: 'assets/images/corn_image.png',
        ),
        Divider(),
        DiagnosisCard(
          date: '11 June',
          status: 'incomplete',
          assetName: 'assets/images/wheat_image.png',
        ),
        Divider(),
        DiagnosisCard(
          date: '11 June',
          status: 'incomplete',
          assetName: 'assets/images/corn_image.png',
        ),
        Divider(),
        DiagnosisCard(
          date: '11 June',
          status: 'incomplete',
          assetName: 'assets/images/wheat_image.png',
        ),
      ],
    );
  }
}
