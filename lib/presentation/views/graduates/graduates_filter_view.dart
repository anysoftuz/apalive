import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class GraduatesFilterView extends StatefulWidget {
  const GraduatesFilterView({super.key});

  @override
  State<GraduatesFilterView> createState() => _GraduatesFilterViewState();
}

class _GraduatesFilterViewState extends State<GraduatesFilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter")),
      bottomNavigationBar: WButton(
        color: blue,
        margin: EdgeInsets.all(16),
        onTap: () {
          Navigator.pop(context);
        },
        text: "Ko’rsatish",
      ),
    );
  }
}
