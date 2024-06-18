import 'package:flutter/material.dart';

class DiagnosisCard extends StatelessWidget {
  final String date;
  final String status;
  final String assetName;
  const DiagnosisCard({
    super.key,
    required this.date,
    required this.status,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Expanded(
        child: Container(
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
            child: Image(
              image: AssetImage(assetName),
              fit: BoxFit.fill,
            )),
      ),
      title: Text(
        date,
        style: const TextStyle(fontSize: 12),
      ),
      subtitle: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Confirm a Diagnosis",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Chip(
                surfaceTintColor: Colors.red,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 6,
                side: const BorderSide(color: Colors.transparent),
                label: Text(
                  status,
                  style: const TextStyle(color: Colors.red, fontSize: 13),
                ))
          ],
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 30,
        color: Colors.black,
      ),
      onTap: () {},
      tileColor: Colors.transparent,
    );
  }
}
