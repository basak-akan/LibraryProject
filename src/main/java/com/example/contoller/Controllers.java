package com.example.contoller;

import com.example.model.Book;
import com.example.model.BookRepository;
import com.fasterxml.jackson.annotation.JsonView;
import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import com.example.model.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.ArrayList;
import java.util.List;


@Controller
public class Controllers {


    @Autowired
    BookRepository bookRepo;

    @RequestMapping("/add/")
    public String addPage() {
        return "add";
    }

    @PostMapping("/add/")
    public void submit(@Valid @ModelAttribute("book")Book book,
                       BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
             System.out.println("Saving error");
        }
        bookRepo.save(book);

        System.out.println("Book saved" + book.toString());
    }


    @GetMapping(value="/list/")
    public List<Book> showAllBooks(Model model) {
        List<Book> bookRecords = new ArrayList<>();
        bookRepo.findAll().forEach(bookRecords::add);
        model.addAttribute("list",bookRecords);
        return bookRecords;


    }

    @PostMapping(value = "/list/")
   public void deleteBook(@ModelAttribute("deletedItem")Book deletedbook, HttpSession session){
        if(deletedbook!= null)
        bookRepo.deleteBookByName(deletedbook.getName());
        /*
        if(updatedbook != null)
          */
   }

    @RequestMapping("/delete-all/")
    public void deleteall() {
        bookRepo.deleteAll();
    }


}
