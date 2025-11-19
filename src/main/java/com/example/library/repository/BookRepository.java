package com.example.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.library.model.Book;

public interface BookRepository extends JpaRepository<Book, Long> {

    @Query("SELECT b.title as bookTitle, a.name as authorName FROM Book b JOIN b.author a")
    List<AuthorBookProjection> fetchBookAuthorJoin();
    // Find books by the author's id
    List<Book> findByAuthorId(Long authorId);

}
