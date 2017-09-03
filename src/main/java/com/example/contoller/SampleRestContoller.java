package com.example.contoller;

import com.example.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@RestController
public class SampleRestContoller {



    @GetMapping("/asd/")
    public String hello(){
        return "index";
    }

  /*  @PostMapping("/add/")
    public void saveBook(@RequestBody Book book, HttpServletRequest request){
        Book newBook = new Book(book.getName(), book.getAuthor(), book.getDate());
        System.out.println("add Post'a girdi.");
        newBook.toString();
    } */
}
