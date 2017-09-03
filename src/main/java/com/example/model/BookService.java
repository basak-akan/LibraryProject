package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import com.example.model.Book;
import com.example.model.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

@Service
public class BookService {

    @Autowired
    private BookRepository bookrepo;

    public List<Book> getAllBooks() {
        List<Book> bookRecords = new ArrayList<>();
        bookrepo.findAll().forEach(bookRecords::add);
        return bookRecords;
    }

    public Book findById(int id)
    {
        return bookrepo.findOne(id);
    }

    public void addBook(Book b) {

        bookrepo.save(b);
    }



}