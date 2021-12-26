import 'dart:io';

// function to check if input string can be converted to number
bool isNumber(string) {
  final number = num.tryParse(string);
  if(number == null) {
    return false;
  }
  else {
    return true;
  }
}

void main() {

  void program() {
        
    print("\nEnter 2 numbers\n");

    num num1 = 0;
    num num2 = 0;
    
    stdout.write('> ');
    var input1 = stdin.readLineSync();
    if(input1 != null && input1.isNotEmpty && isNumber(input1)) {
      num1 = num.parse(input1);
    }
    else {
      print('Invalid input!');
      return program();
    }

    stdout.write('> ');
    var input2 = stdin.readLineSync();
    if(input2 != null && input2.isNotEmpty && isNumber(input2)) {
      num2 = num.parse(input2);
    }
    else {
      print('Invalid input!');
      return program();
    }

    print("\nChoose an option:");
    print("1. Add");
    print("2. Subtract");
    print("3. Multiply");
    print("4. Divide");
    print("5. Exit\n");

    stdout.write('> ');
    num choice = 0;
    var input = stdin.readLineSync();
    stdout.write('\n');
    if(input != null && input.length > 0) {
      choice = num.parse(input);
    }
    else {
      return print('Not a valid choice!');
    }
  
    switch(choice) {
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