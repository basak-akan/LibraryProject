package com.example.model;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import javax.transaction.Transactional;

public interface BookRepository extends CrudRepository<Book, Integer> {


    @Transactional
    void deleteBookByName(String firstName);
}
