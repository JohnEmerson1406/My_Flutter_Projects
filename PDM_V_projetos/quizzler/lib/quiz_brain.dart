import 'questions.dart';

// 1 - verdadeiro, 2 - talvez, 3 - falso

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', 1),
    Question('You can lead a cow down stairs but not up stairs.', 2),
    Question('Approximately one quarter of human bones are in the feet.', 1),
    Question('Xandão does not bleed', 2),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', 1),
    Question('It is illegal to pee in the Ocean in Portugal.', 1),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        3),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        1),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        3),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        1),
    Question('ADS is the best IFPI course', 2),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        1),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        1),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  int getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void resetQuiz() {
    _questionNumber = 0;
  }
}
