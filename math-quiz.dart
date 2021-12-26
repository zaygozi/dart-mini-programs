import 'dart:io';
import 'dart:math';

class Quiz {

  // late signifies the variable will be initialized in the future before usage
  late num num1;
  late num num2;
  late String op;
  late num answer;

  Quiz(num num1, num num2, String op, num answer) {
    this.num1 = num1;
    this.num2 = num2;
    this.op = op;
    this.answer = answer;
  }

}

List<String> operators = ['+', '-', '*', '/'];

// function which constantly generates new arithmetic problems
dynamic mathProblem() {

  num n1 = Random().nextInt(100);
  num n2 = Random().nextInt(100);
  String operator = operators[Random().nextInt(operators.length)];
  num answer = 0;

  if(operator == '+') {
    answer = n1 + n2;
  }
  else if(operator == '-') {
    answer = n1 - n2;
  }
  else if(operator == '*') {
    answer = n1 * n2;
  }
  else {
    answer = n1 / n2;
  }

  Quiz quiz = Quiz(n1, n2, operator, answer);
  return quiz;

}

// check if string contains a number
bool isNumber(input) {
  final number = num.tryParse(input);
  return number != null;
}

// Score counters
int total_questions = 0;
int right_answers = 0;

// Game interface
void game() {

  print("\nHere's a math problem for you:\n");
  dynamic quiz = mathProblem();
  stdout.write("${quiz.num1} ${quiz.op} ${quiz.num2} = ");
  var input = stdin.readLineSync();
  total_questions++;

  if(input != null && input.isNotEmpty && isNumber(input)) {
    if(num.parse(input) == quiz.answer) {
      // Right answer
      print("\nHurray, you got it right!\n");
      right_answers++;
      stdout.write("Continue? (y/n): ");
      if(stdin.readLineSync() == 'y') {
        return game();
      }
      else {
        return print("\nYou got ${right_answers} out of ${total_questions} questions right!\n");
      }
    }
    else {
      // Wrong answer
      print("\nSorry, that's the wrong answer. The right answer is ${quiz.answer}\n");
      stdout.write("Continue? (y/n): ");
      if(stdin.readLineSync() == 'y') {
        return game();
      }
      else {
        return print("\nYou got ${right_answers} out of ${total_questions} questions right!\n");
      }
    }
  }
  else {
    print("\nThat's an invalid input!\n");
    stdout.write("Continue? (y/n): ");
    if(stdin.readLineSync() == 'y') {
      return game();
    }
    else {
      return print("\nYou got ${right_answers} out of ${total_questions} questions right!\n");
    }
  }

}

void main() {
  print("\nWelcome to this easy math quiz. The program will generate new problems for you until you wanna stop!\n");
  stdout.write("Start playing? (y/n): ");
  if(stdin.readLineSync() == 'y') {
    return game();
  }
  else {
    return;
  }
}