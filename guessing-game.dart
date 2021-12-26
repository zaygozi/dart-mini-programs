import 'dart:math';
import 'dart:io';

List<String> answers = ['house', 'egg', 'future', 'barber', 'sponge', 'hole', 'coin', 'g', 'nothing', 'coffin', 'map', 'bookkeeper', 'silence', 'fishhook', 'm', 'echo', 'priest', 'tongue', 'joke', 'short'];
List<String> hints = ['I am strong and I am tall. Made of bricks, I keep you warm and safe. Sunlight in but rain stays out. Oh honey, who am I?', 'What has to be broken before you can use it?', 'What is always in front of you but can’t be seen?', 'I shave every day, but my beard stays the same. Who am I?', 'What is full of holes but still holds water?', 'What gets bigger the more you take away?', 'What has a head and a tail, but no body?', 'What is the end of everything?', 'Poor people have it. Rich people need it. If you eat it you die. What is it?', 'The person who makes it has no need of it; the person who buys it has no use for it. The person who uses it can neither see nor feel it. What is it?', 'I have cities, but no houses. I have mountains, but no trees. I have water, but no fish. What am I?', 'What English word has three consecutive double letters?', 'What disappears as soon as you say its name?', 'First you eat me, then you get eaten. What am I?', 'What comes once in a minute, twice in a moment, but never in a thousand years?', 'I speak without a mouth and hear without ears. I have no body but come alive with wind. What am I?', ' I have married many times, but have always been single. Who am I?', 'What tastes better than it smells?', 'I can be cracked, I can be made. I can be told, I can be played. What am I?', 'Which word becomes shorter when you add 2 letters to it?'];

num counter = 3;

List<int> used_riddles = [];  // Keeps track of indexes of riddles that have been issued once

void main() {
  print("\nWelcome to the guessing game! Answer in 1 word. You will have 3 tries to win the game.\n");
  stdout.write('So shall we begin? (y/n): ');
  if(stdin.readLineSync() == 'y') {
    game();
  }
  else {
    return;
  }
}

void game() {
  int selection = Random().nextInt(answers.length);
  // If riddle is not unique, give another riddle
  while(used_riddles.contains(selection)) {
    selection = Random().nextInt(answers.length);
    // All riddles in the list have been issued
    if(answers.length == used_riddles.length) {
      return print("\nTu es un génie! You have won the game with ${counter} tries remaining!");
    }
  }
  print('\n${hints[selection]}\n');
  String i = answers[selection];
  stdout.write('> ');
  var input = stdin.readLineSync();
  while(input != null && input.isNotEmpty && input.toLowerCase() != i) {
    counter--;
    if(counter == 0) {
      print('\nYou lost! Answer was ${i}\n');
      stdout.write("Restart game? (y/n): ");
      if(stdin.readLineSync() == 'y') {
        counter = 3;
        used_riddles = [];  // Resetting counter and used list as game is restarted  
        return game();
      }
      else {
        return;
      }
    }
    print('\nWrong guess! ${counter} guesses remaining\n');
    stdout.write('> ');
    input = stdin.readLineSync();
  }
  print("\nRight answer!\n");
  stdout.write("Continue? (y/n): ");
  if(stdin.readLineSync() == 'y') {
    used_riddles.add(selection);  // Riddle registered as used
    return game();
  }
  else {
    return;
  }
}