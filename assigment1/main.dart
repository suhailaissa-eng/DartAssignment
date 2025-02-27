class Book {
  String title;
  String author;
  int year;
  String genre;

  Book(this.title, this.author, this.year, this.genre);
}

class Library {
  Map<String, Book> books = {};

  void addBook(Book book) {
    books[book.title] = book;
    print("Book added successfully");
  }

  void getBookInfo({required String title}) {
    books.forEach((key, value) {
      if (key == title) {
        print(
          "Title: ${value.title}, Author: ${value.author}, Year: ${value.year}, Genre: ${value.genre}",
        );
      }
    });
  }

  void listAllBooks(String? genre) {
    if (genre != null) {
      var booksInGenre =
          books.entries.where((entry) => entry.value.genre == genre).toList();

      if (booksInGenre.isEmpty) {
        print("No books found for the genre");
      } else {
        print("Books in the genre '$genre':");
        booksInGenre.forEach((entry) {
          print(
            " ${entry.value.title} the author ${entry.value.author} in (${entry.value.year})",
          );
        });
      }
    } else {
      if (books.isEmpty) {
        print("No books available in the library.");
      } else {
        print("List of all books:");
        books.forEach((title, book) {
          print(" $title by ${book.author} (${book.year}) [${book.genre}]");
        });
      }
    }
  }

  void listBooksByGenre({required String genre}) {
    var booksInGenre =
        books.entries.where((entry) => entry.value.genre == genre).toList();

    if (booksInGenre.isEmpty) {
      print("No books found for this genre.");
    } else {
      print("Books in the genre '$genre':");
      booksInGenre.forEach((entry) {
        print(
          "${entry.value.title} by ${entry.value.author} (${entry.value.year})",
        );
      });
    }
  }

  void removeBook({required String title}) {
    var book = books[title];

    if (book != null) {
      books.remove(title);
      print("Book removed successfully.");
    } else {
      print("Book not found.");
    }
  }
}

void main() {
  Library library = Library();

  library.addBook(
    Book("The Idiot", "Fyodor Dostoevsky", 1869, "Psychological Fiction"),
  );
  library.addBook(
    Book(
      "Notes from Underground",
      "Fyodor Dostoevsky",
      1864,
      "Existential Fiction",
    ),
  );
  library.addBook(
    Book("Demons", "Fyodor Dostoevsky", 1872, "Political Fiction"),
  );
  library.addBook(Book("Hamlet", "William Shakespeare", 1600, "Tragedy"));
  library.addBook(
    Book("Romeo and Juliet", "William Shakespeare", 1597, "Tragedy"),
  );

  library.listAllBooks(null);

  library.listBooksByGenre(genre: "Tragedy");

  library.getBookInfo(title: "The Idiot");

  library.removeBook(title: "Romeo and Juliet");
}