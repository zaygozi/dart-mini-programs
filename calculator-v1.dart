import 'dart:io';

void main() {

  void program() {
    // stdout.write gets input on same line instead of new line
    // ! suggests that the input can't be null or it is being handled
    print("\nEnter 2 numbers\n");

    stdout.write('> ');
    var input1 = stdin.readLineSync();
    if(num.tryParse(input1!) == null) {
      print('Invalid input!');
      return program();
    }
    num num1 = num.tryParse(input1)!;

    stdout.write('> ');
    var input2 = stdin.readLineSync();
    if(num.tryParse(input2!) == null) {
      print('Invalid input!');
      return program();
    }
    num num2 = num.tryParse(input2)!;

    print("\nChoose an option:");
    print("1. Add");
    print("2. Subtract");
    print("3. Multiply");
    print("4. Divide");
    print("5. Exit\n");

    stdout.write('> ');
    var choice = stdin.readLineSync();
    stdout.write('\n');
    if(num.tryParse(choice!) == null) {
      return print('Not a valid choice!');
    }
  
    switch(num.parse(choice)) {
      case 1:
        print(num1 + num2);
        stdout.write("Do you want to continue? (y/n): ");
        if(stdin.readLineSync() == 'y') {
          return program();
        }
        else {
          return;
        }
      case 2:
        print(num1 - num2);
        stdout.write("Do you want to continue? (y/n): ");
        if(stdin.readLineSync() == 'y') {
          return program();
        }
        else {
          return;
        }
      case 3:
        print(num1 * num2);
        stdout.write("Do you want to continue? (y/n): ");
        if(stdin.readLineSync() == 'y') {
          return program();
        }
        else {
          return;
        }
      case 4:
        print(num1 / num2);
        stdout.write("Do you want to continue? (y/n): ");
        if(stdin.readLineSync() == 'y') {
          return program();
        }
        else {
          return;
        }
      case 5:
        return;
      default:
        print("Invalid choice!");

    }

  }

  // First execution
  program();

}