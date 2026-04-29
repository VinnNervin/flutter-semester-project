import 'package:first_app/core/widgets/MainButton/main_button.dart';
import 'package:first_app/core/widgets/MainButton/main_button_config.dart';
import 'package:flutter/material.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
import 'package:first_app/theme/app_sizing.dart';
import 'package:first_app/features/stage/controllers/stage_controller.dart';
import 'package:first_app/features/stage/models/question_model.dart';

class StagePage extends StatefulWidget {
  final String filePath;
  const StagePage({super.key, required this.filePath});

  @override
  State<StagePage> createState() => _StagePageState();
}

class _StagePageState extends State<StagePage> {
  final StageController _controller = StageController();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await _controller.init(widget.filePath);
    if (mounted) setState(() {});
  }

  void _onAnswerSelected(int index) {
    if (_controller.isAnswered) return;

    setState(() {
      _controller.checkAnswer(index);
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        if (_controller.nextQuestion()) {
          setState(() {});
        } else {
          _showFinishDialog();
        }
      }
    });
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Stage Selesai!", textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events, color: Colors.orange, size: 80),
            const SizedBox(height: 10),
            Text(
              "Skor Anda: ${_controller.correctAnswers} / ${_controller.questions.length}",
              style: const TextStyle(
                fontSize: AppFonts.fontMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          MainButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            config: MainButtonConfig(label: "selesai"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentQuestion = _controller.currentQuestion;
    if (currentQuestion == null) return const Scaffold();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: _buildProgressBar(_controller.progress),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizing.paddingMD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildQuestionCard(currentQuestion),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: currentQuestion.options.length,
                  itemBuilder: (context, index) =>
                      _buildOptionTile(index, currentQuestion),
                ),
              ),
              if (_controller.isAnswered) _buildExplanationBox(currentQuestion),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(double progress) {
    return Container(
      width: double.infinity,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(QuestionModel question) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Pertanyaan ${_controller.currentIndex + 1}/${_controller.questions.length}",
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: AppFonts.fontSmall,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            question.question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: AppFonts.fontLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(int index, QuestionModel question) {
    bool isSelected = _controller.selectedOption == index;
    bool isCorrect = index == question.correctIndex;

    Color borderColor = AppColors.grey;
    Color bgColor = AppColors.white;

    if (_controller.isAnswered) {
      if (isCorrect) {
        borderColor = Colors.green;
        bgColor = Colors.green.withValues(alpha: 0.1);
      } else if (isSelected) {
        borderColor = Colors.red;
        bgColor = Colors.red.withValues(alpha: 0.1);
      }
    } else if (isSelected) {
      borderColor = AppColors.primary;
    }

    return GestureDetector(
      onTap: () => _onAnswerSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: isSelected && _controller.isAnswered
                  ? borderColor
                  : Colors.transparent,
              child: Text(
                String.fromCharCode(65 + index),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected && _controller.isAnswered
                      ? Colors.white
                      : borderColor,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                question.options[index],
                style: const TextStyle(
                  fontSize: AppFonts.fontMedium,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            if (_controller.isAnswered && isCorrect)
              const Icon(Icons.check_circle, color: Colors.green)
            else if (_controller.isAnswered && isSelected && !isCorrect)
              const Icon(Icons.cancel, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanationBox(QuestionModel question) {
    bool isCorrect = _controller.selectedOption == question.correctIndex;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        question.explanation,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isCorrect ? Colors.green[800] : Colors.red[800],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
