import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/features/tip_questions/presentation/widgets/item_tip_question.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_question.dart';

class TipQuestionScreen extends StatefulWidget {
  final List<TipQuestion>? tipQuestions;

  const TipQuestionScreen({required this.tipQuestions});

  @override
  _TipQuestionScreenState createState() => _TipQuestionScreenState();
}

class _TipQuestionScreenState extends State<TipQuestionScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.corePalatte.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => AutoRouter.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.2,
            child: PageView.builder(
                pageSnapping: true,
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                itemCount: widget.tipQuestions!.length,
                itemBuilder: (context, index) {
                  return ItemTipQuestion(
                    pageController: pageController,
                    tipQuestion: widget.tipQuestions![index],
                    isLastQuestion: index == widget.tipQuestions!.length - 1,
                  );
                }),
          ),
        ));
  }
}
