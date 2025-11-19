package com.example.library.controller;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.library.model.Author;
import com.example.library.model.Book;
import com.example.library.service.AuthorService;
import com.example.library.service.BookService;

@Controller
@RequestMapping("/books")
public class BookController {

    private final BookService bookService;
    private final AuthorService authorService;

    public BookController(BookService bookService, AuthorService authorService) {
        this.bookService = bookService;
        this.authorService = authorService;
    }

    @GetMapping
    public String list(@org.springframework.web.bind.annotation.RequestParam(value = "authorId", required = false) Long authorId,
                       Model model) {
        if (authorId != null) {
            model.addAttribute("books", bookService.findByAuthorId(authorId));
            model.addAttribute("selectedAuthor", authorService.findById(authorId));
        } else {
            model.addAttribute("books", bookService.findAll());
        }
        model.addAttribute("pairs", bookService.getBookAuthorPairs());
        return "books";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("authors", authorService.findAll());
        return "addBook";
    }

    @PostMapping("/add")
    public String addSubmit(@ModelAttribute Book book, Model model) {
        try {
            // Attach author if id provided
            if (book.getAuthor() != null && book.getAuthor().getId() != null) {
                Author a = authorService.findById(book.getAuthor().getId());
                book.setAuthor(a);
            }
            bookService.save(book);
            return "redirect:/books";
        } catch (DataIntegrityViolationException ex) {
            model.addAttribute("error", "Integrity violation: " + ex.getMostSpecificCause().getMessage());
            model.addAttribute("authors", authorService.findAll());
            return "addBook";
        }
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("book", bookService.findById(id));
        model.addAttribute("authors", authorService.findAll());
        return "editBook";
    }

    @PostMapping("/edit")
    public String editSubmit(@ModelAttribute Book book) {
        if (book.getAuthor() != null && book.getAuthor().getId() != null) {
            Author a = authorService.findById(book.getAuthor().getId());
            book.setAuthor(a);
        }
        bookService.save(book);
        return "redirect:/books";
    }
}
