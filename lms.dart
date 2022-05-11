// ignore_for_file: unused_local_variable, camel_case_types

import 'dart:io';
import 'dart:core';

/// The class BookData has a constructor that initializes the borrowreaders list to contain the string
/// "No" for each element in the list
class BookData {
  BookData() {
    String noreaders = "No";
    for (int i = 0; i < borrowreaders.length; i++) {
      borrowreaders[i] = noreaders;
    }
  }
  List<String> title = [];
  List<String> authors = [];
  List<String> genre = [];
  List<String> isbn = [];
  List<String> borrowreaders = [];
}

/// The class UserData has two properties, username and pswd, and two methods, getUser and getPswd
class UserData {
  String username = "admin";
  String pswd = "admin";

  String getUser() => username;
  String getPswd() => pswd;
}

class bookFunc {
  static BookData book = BookData();
  UserData user = UserData();

  /// If the username is correct, check if the password is correct. If it is, return 1. If it isn't,
  /// return 0. If the username is incorrect, return -1
  ///
  /// Args:
  ///   username (String): The username that the user entered
  ///   password (String): the password the user entered
  ///
  /// Returns:
  ///   The return value is the result of the login method.
  int login(String username, String password) {
    if (username == user.getUser()) {
      if (password == user.getPswd()) {
        return 1;
      } else {
        return 0;
      }
    } else {
      return -1;
    }
  }

  /// If the user enters 0, show all the books. If the user enters a number between 1 and the number of
  /// books, show the book with that number. Otherwise, show an error message and call the function again
  showBook() {
    num total = book.title.length - remainSpace();
    print("This Library has Total of $total Books");
    int a = bookInfo();
    if (a == 0) {
      showAll();
    } else {
      if ((a > 0) && (a <= book.title.length)) {
        showInfo(a);
      } else {
        print("Invalid Input");
        showBook();
      }
    }
  }

  /// It prints out all the books in the library.
  showAll() {
    for (int i = 0; i < book.title.length; i++) {
      if (book.title[i].isNotEmpty) {
        print(("Title:" + book.title[i]) + "");
        print(("Author:" + book.authors[i]) + "");
        print(("Genre:" + book.genre[i]) + "");
        print(("ISBN:" + book.isbn[i]) + "");
        print("borrower:" + book.borrowreaders[i]);
      }
    }
  }

  /// The function takes an integer as an argument and prints the title, author, genre, and ISBN of the
  /// book at the index of the integer
  ///
  /// Args:
  ///   a (int): The number of the book you want to see the info of.
  showInfo(int a) {
    int i = a;
    print("Title: " + book.title[i - 1]);
    print("Author: " + book.authors[i - 1]);
    print("Genre: " + book.genre[i - 1]);
    print("ISBN: " + book.isbn[i - 1]);
  }

  /// The above code is a function that is used to display the information of the book.
  get bookInfo {
    for (int i = 0; i < book.title.length; i++) {
      if (book.title[i].isNotEmpty) {
        print(("Title: " + book.title[i]) + "");
      }
    }
    print(
        "Enter the corresponding number to view the detailed information of the corresponding book (input 0 to view all information):");
    int i = stdin.readByteSync();
    return i;
  }

  /// If the last element in the title array is not empty, return -1. If the last element in the title
  /// array is empty, check if the title already exists in the array. If it does, return 0. If it doesn't,
  /// add the book and return 1
  ///
  /// Args:
  ///   title (String): String
  ///   author (String): String
  ///   genre (String): String
  ///   isbn (String): String
  ///
  /// Returns:
  ///   the value of the flag variable.
  addBook(String title, String author, String genre, String isbn) {
    int flag = 0;
    if (book.title[book.title.length - 1].isNotEmpty) {
      flag = (-1);
    }
    if (book.title[book.title.length - 1].isEmpty) {
      for (int i = 0; i < book.title.length; i++) {
        if (title == book.title[i]) {
          flag = 0;
          break;
        }
        if (!(title == book.title[i])) {
          addBook(title, author, genre, isbn);
          flag = 1;
          break;
        }
      }
    }
    return flag;
  }

  /// Counting the number of empty spaces in the title of the book.
  get remainSpace {
    int count = 0;
    try {
      for (int i = 0; i < book.title.length; i++) {
        if (book.title[i].isEmpty) {
          ++count;
        }
      }
    } on FormatException {
      print("Error");
    }
    return count;
  }

  /// It takes a string as an argument and checks if it matches any of the book titles in the array. If it
  /// does, it returns 1, if it doesn't, it returns 0. If the string is empty, it returns -1
  ///
  /// Args:
  ///   bookname (String): the name of the book that the user wants to search for
  ///
  /// Returns:
  ///   the value of the flag variable.
  int selectBook(String bookname) {
    int flag = 0;
    for (int i = 0; i < book.title.length; i++) {
      if (bookname == "") {
        flag = (-1);
        break;
      }
      if (bookname == book.title[i]) {
        flag = 1;
        showInfo(i + 1);
        break;
      }
      if (!(bookname == book.title[i])) {
        if (i == (book.title.length - 1)) {
          flag = 0;
        }
      }
    }
    return flag;
  }

  /// It takes a string as an argument and returns the index of the string in the list
  ///
  /// Args:
  ///   bookname (String): the name of the book you want to search for
  ///
  /// Returns:
  ///   The index of the book in the array.
  int selectIndex(String bookname) {
    int flag = (-1);
    for (int i = 0; i < book.title.length; i++) {
      if (bookname == book.title[i]) {
        flag = i;
      }
    }
    return flag;
  }

  /// It takes a bookname as a parameter, finds the index of the bookname in the list, and then removes
  /// the bookname from the list
  ///
  /// Args:
  ///   bookname (String): The name of the book you want to delete.
  deleteBook(String bookname) {
    int a = selectIndex(bookname);
    book.title.removeAt(a);
    book.authors.removeAt(a);
    book.genre.removeAt(a);
    book.isbn.removeAt(a);
  }

  /// If the book is not in the library, return -1. If the book is in the library, but no one has borrowed
  /// it, return 0. If the book is in the library and someone has borrowed it, return 1
  ///
  /// Args:
  ///   bookname (String): the name of the book
  ///
  /// Returns:
  ///   the index of the book in the array.
  int testReader(String bookname) {
    int a = selectIndex(bookname);
    if (a >= 0) {
      if ((book.borrowreaders[a].isEmpty) || (book.borrowreaders[a] == "")) {
        return 0;
      } else {
        return 1;
      }
    } else {
      return -1;
    }
  }

  /// It takes a book name as a parameter, finds the index of the book in the list, and sets the
  /// borrowreader of that book to "None"
  ///
  /// Args:
  ///   bookname (String): The name of the book
  setBorrowReader(String bookname) {
    int a = selectIndex(bookname);
    book.borrowreaders[a] = "None";
  }

  /// It takes a book name as a parameter, finds the index of the book in the list, and returns the name
  /// of the reader who borrowed the book
  ///
  /// Args:
  ///   bookname (String): the name of the book
  ///
  /// Returns:
  ///   The name of the reader who borrowed the book.
  String getBorrowReader(String bookname) {
    int a = selectIndex(bookname);
    return book.borrowreaders[a];
  }

  /// It borrows a book from the library.
  ///
  /// Args:
  ///   bookname (String): the name of the book
  ///   readername (String): the name of the reader who wants to borrow the book
  void borrow(String bookname, String readername) {
    int a = selectBook(bookname);
    book.borrowreaders[a] = readername;
  }
}

class operation {
  bookFunc b = bookFunc();
  List g = [
    "Computer Science",
    "Philosophy",
    "Pure Science",
    "Art and Recreation",
    "History"
  ];

  /// The function takes in a username and password, and then calls the login function in the backend. If
  /// the login function returns 1, then the user is logged in. If the login function returns -1, then the
  /// user is told that the account doesn't exist
  login() {
    print("Login");
    print("Username");
    String? username = stdin.readLineSync();
    print("Password");
    String? password = stdin.readLineSync();
    int temp = b.login(username!, password!);

    switch (temp) {
      case 1:
        print("Login Successful");
        menu();
        break;
      case -1:
        print("Account Doesn't Exist");
        login();
        break;
    }
  }

  menu() {
    bookFunc l = bookFunc();
    print("[1] List of Books");
    print("[2] Add Book");
    print("[3] Borrow Book");
    print("[4] Return Book");
    print("[0] Exit");
    print("Select: ");
    int a = stdin.readByteSync();
    switch (a) {
      case 1:
        l.showBook();
        break;
      case 2:
        addBook();
        break;
      case 3:
        borrowBook();
        break;
      case 4:
        returnBook();
        break;
      case 0:
        print("Exiting...");
        break;
    }
  }

  /// It takes user input for a book's title, author, genre, and ISBN, and then adds the book to the
  /// library
  addBook() {
    print("Book Information");
    print("Title: ");
    String? title = stdin.readLineSync();
    print("Author: ");
    String? author = stdin.readLineSync();
    String? genre;
    do {
      print("Genre: ");
      genre = stdin.readLineSync();
    } while (!g.contains(genre));
    String? isbn;
    while (isValid(isbn!)) {
      print("ISBN[ISBN-10]:  ");
      isbn = stdin.readLineSync();
    }
    int temp = b.addBook(title!, author!, genre!, isbn);
    switch (temp) {
      case 1:
        print("$title added successfully");
        break;
      case 0:
        print("$title already exist");
        addBook();
        break;
      case -1:
        print("Failed to add $title. Library is Full");
        menu();
        break;
    }
  }

  /// The function takes in a title of a book and deletes it from the library
  deleteBook() {
    print("Title of the book to be deleted");
    String? title = stdin.readLineSync();
    int temp = b.testReader(title!);
    if (temp == 0) {
      b.deleteBook(title);
      print("$title delete from library");
    } else if (temp == 1) {
      print("Book is Currently Used");
      print("[0] Main Menu\n[1] Delete Another");
      int i = stdin.readByteSync();
      if (i == 0) {
        menu();
      } else if (i == 1) {
        deleteBook();
      }
    } else {
      print("Book doesn't exist");
      print("[0] Main Menu\n[1] Delete Another");
      int c = stdin.readByteSync();
      if (c == 0) {
        menu();
      } else if (c == 1) {
        deleteBook();
      }
    }
  }

  /// The function takes in a title of a book and checks if the book is currently in use. If it is, it
  /// sets the book to be available. If it isn't, it prints a message saying so
  returnBook() {
    print("Title of the book to be returned");
    String? title = stdin.readLineSync();
    int flag = b.testReader(title!);
    if (flag == 0) {
      print("$title is not currently in used");
      print("[0] Main Menu\n[1] Return Another Book");
      int i = stdin.readByteSync();
      if (i == 0) {
        menu();
      } else if (i == 1) {
        returnBook();
      }
    } else if (flag == -1) {
      print("$title doesn't exist");
      print("[0] Main Menu\n[1] Return Another Book");
      int i = stdin.readByteSync();
      if (i == 0) {
        menu();
      } else if (i == 1) {
        returnBook();
      }
    } else if (flag == 1) {
      print("$title has been returned");
      b.setBorrowReader(title);
      print("[0] Main Menu\n[1] Return Another Book");
      int i = stdin.readByteSync();
      if (i == 0) {
        menu();
      } else if (i == 1) {
        returnBook();
      }
    }
  }

  /// The function borrowBook() asks the user for the title of the book they want to borrow, and then
  /// calls the function testReader() from the Book class to check if the book is available. If the book
  /// is available, the function borrow() from the Book class is called to borrow the book. If the book
  /// is not available, the user is informed that the book is not available
  borrowBook() {
    print("Title of the book you want to borrow: ");
    String? title = stdin.readLineSync();
    int temp = b.testReader(title!);
    switch (temp) {
      case 0:
        print("Name: ");
        String? name = stdin.readLineSync();
        b.borrow(title, name!);
        print("[0] Main Menu\n[1] Borrow Another Book");
        int i = stdin.readByteSync();
        if (i == 0) {
          menu();
        } else if (i == 1) {
          borrowBook();
        }
        break;
      case 1:
        print("$title already borrowed");
        stdout.write("[0] Main Menu\n[1] Borrow Another Book");
        int i = stdin.readByteSync();
        if (i == 0) {
          menu();
        } else if (i == 1) {
          returnBook();
        }
        break;
      case -1:
        print("Failed to borrow $title. Book not found");
        print("[0] Main Menu\n[1] Borrow Another Book");
        int i = stdin.readByteSync();
        if (i == 0) {
          menu();
        } else if (i == 1) {
          returnBook();
        }
        break;
    }
  }
}

/// It checks if the ISBN is valid by checking if it's a 10 digit number with dashes and an X at the
/// end, then it sums the digits multiplied by their position in the ISBN and checks if the sum is
/// divisible by 11
///
/// Args:
///   isbn (String): The ISBN to validate.
///
/// Returns:
///   A boolean value.
bool isValid(String isbn) {
  if (RegExp(r'^[0-9-]{9,}?[0-9X]{1}$').stringMatch(isbn) != isbn) return false;
  var digits = isbn.replaceAll('-', '').split('').reversed.toList();
  var total = digits
      .asMap()
      .map((i, d) => MapEntry(i, (int.tryParse(d) ?? 10) * (i + 1)))
      .values
      .reduce((a, b) => a + b);
  return total % 11 == 0 && digits.length == 10;
}

main() {
  operation o = operation();
  print("Library Management System\n\n[username: admin password: admin]");
  o.login();
}
