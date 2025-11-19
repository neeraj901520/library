package com.example.library.service;

import com.example.library.model.Author;
import com.example.library.repository.AuthorRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

public class AuthorServiceTest {

    @Mock
    private AuthorRepository authorRepository;

    @InjectMocks
    private AuthorService authorService;

    @BeforeEach
    void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testFindAll() {
        Author a1 = new Author(); a1.setName("A1"); a1.setEmail("a1@example.com");
        Author a2 = new Author(); a2.setName("A2"); a2.setEmail("a2@example.com");
        when(authorRepository.findAll()).thenReturn(Arrays.asList(a1, a2));

        List<Author> result = authorService.findAll();
        assertEquals(2, result.size());
        assertEquals("A1", result.get(0).getName());
    }
}
