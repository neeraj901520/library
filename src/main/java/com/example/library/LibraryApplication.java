package com.example.library;

import com.example.library.model.Author;
import com.example.library.model.Book;
import com.example.library.repository.AuthorRepository;
import com.example.library.repository.BookRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.stream.IntStream;

@SpringBootApplication
public class LibraryApplication {

    public static void main(String[] args) {
        SpringApplication.run(LibraryApplication.class, args);
    }

    // Populate sample data (10 authors & 10 books)
    @Bean
    CommandLineRunner initData(AuthorRepository authorRepo, BookRepository bookRepo) {
        return args -> {
            if (authorRepo.count() == 0 && bookRepo.count() == 0) {
                IntStream.rangeClosed(1, 10).forEach(i -> {
                    Author a = new Author();
                    a.setName("Author " + i);
                    a.setEmail("author" + i + "@example.com");
                    authorRepo.save(a);
                });

                // Create 10 books, map each to an author
                IntStream.rangeClosed(1, 10).forEach(i -> {
                    Book b = new Book();
                    b.setTitle("Book Title " + i);
                    b.setIsbn("ISBN-" + (1000 + i));
                    // assign author i (exists)
                    Author author = authorRepo.findById((long) i).orElse(null);
                    b.setAuthor(author);
                    bookRepo.save(b);
                });
            }
        };
    }
}
