package com.example.library.controller;

import com.example.library.model.Author;
import com.example.library.service.AuthorService;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/authors")
public class AuthorController {

    private final AuthorService authorService;

    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("authors", authorService.findAll());
        return "authors";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("author", new Author());
        return "addAuthor";
    }

    @PostMapping("/add")
    public String addSubmit(@ModelAttribute Author author, Model model) {
        try {
            authorService.save(author);
            return "redirect:/authors";
        } catch (DataIntegrityViolationException ex) {
            model.addAttribute("error", "Integrity violation: " + ex.getMostSpecificCause().getMessage());
            return "addAuthor";
        }
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("author", authorService.findById(id));
        return "editAuthor";
    }

    @PostMapping("/edit")
    public String editSubmit(@ModelAttribute Author author) {
        authorService.save(author);
        return "redirect:/authors";
    }
}
