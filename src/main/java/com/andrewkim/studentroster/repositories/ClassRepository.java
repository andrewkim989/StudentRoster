package com.andrewkim.studentroster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.andrewkim.studentroster.models.Class;

@Repository
public interface ClassRepository extends CrudRepository <Class, Long>{
	List <Class> findAll();
	Class findByClassName(String name);
}
