import 'package:flutter/material.dart';
import '../models/explanation_screen_model.dart';
import '../widgets/explanation_view_body.dart';

class ExplanationView extends StatelessWidget {
  const ExplanationView({super.key,required this.explanationScreenModel});
  final ExplanationScreenModel explanationScreenModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExplanationViewBody(explanationScreenModel: explanationScreenModel,),
    );
  }
}
