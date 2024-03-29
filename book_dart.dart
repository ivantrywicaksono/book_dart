// import 'package:book_dart/book_dart.dart' as book_dart;

import 'dart:io';

// Define a class to represent a book
class Book {
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);

  void showBook() {
    print('Judul: ${title}');
    print('Penulis: ${author}');
    print('Tahun: ${year}');
  }

  void updateBook() {
    print('Informasi apa yang ingin Anda perbarui?');
    print('1. Judul');
    print('2. Penulis');
    print('3. Tahun');

    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        print('Masukkan judul baru:');
        title = stdin.readLineSync()!;
        break;
      case 2:
        print('Masukkan penulis baru:');
        author = stdin.readLineSync()!;
        break;
      case 3:
        print('Masukkan tahun baru:');
        year = int.parse(stdin.readLineSync()!);
        break;
      default:
        print('Pilihan tidak valid.');
    }
  }
}

// Define a class to manage the book collection
class BookCollection {
  List<Book> _books = [];

  void addBook() {
    print('Masukkan judul: ');
    String title = stdin.readLineSync()!;
    print('Masukkan penulis: ');
    String author = stdin.readLineSync()!;
    print('Masukkan tahun terbit: ');
    int year = int.parse(stdin.readLineSync()!);

    _books.add(Book(title, author, year));
  }

  void showBooks() {
    if (_books.isEmpty) {
      print('Data masih kosong!');
      return;
    }

    for (int i = 0; i < _books.length; i++) {
      print('--- Data ke-${i + 1} ---');
      _books[i].showBook();
    }
  }

  void editBook(int index) {
    if (_books.isEmpty) {
      print('Data masih kosong!');
      return;
    }

    if (index < 1 || index > _books.length) {
      print('Nomor buku tidak valid!');
      return;
    }

    _books[index - 1].updateBook();
  }

  void deleteBook(int index) {
    if (_books.isEmpty) {
      print('Data masih kosong!');
      return;
    }

    print('Masukkan nomor buku yang ingin dihapus: ');

    if (index <= 0 || index > _books.length) {
      print('Nomor buku tidak valid!');
      return;
    }

    _books.removeAt(index - 1);

    print('Buku berhasil dihapus!');
  }
}

void main() {
  BookCollection bookCollection = BookCollection();

  while (true) {
    // Menampilkan menu
    printMenu();
    String menu = stdin.readLineSync()!;
    switch (menu) {
      case '1':
        // Menambah data
        bookCollection.addBook();
        break;
      case '2':
        // Menampilkan data
        bookCollection.showBooks();
        print("\nTekan enter untuk kembali ke menu utama");
        stdin.readLineSync();
        break;
      case '3':
        // Mengubah data
        bookCollection.showBooks();
        print("Masukkan nomor buku yang akan diedit: ");
        int index = int.parse(stdin.readLineSync()!);
        bookCollection.editBook(index);
        break;
      case '4':
        // Menghapus data
        bookCollection.showBooks();
        print("Masukkan nomor buku yang akan dihapus: ");
        int index = int.parse(stdin.readLineSync()!);
        bookCollection.deleteBook(index);
        break;
      case '5':
        // Keluar dari aplikasi
        print('Terima kasih!');
        exit(0);
      default:
        print('Pilihan tidak valid!');
        stdin.readLineSync();
    }
  }
}

void printMenu() {
  print('--- Bookshelf ---');
  print('1. Tambah Buku');
  print('2. Tampilkan Buku');
  print('3. Ubah Buku');
  print('4. Hapus Buku');
  print('5. Keluar');
  print('---------------------');
  print('Masukkan pilihan: ');
}
