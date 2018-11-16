package com.andrewkim.studentroster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.andrewkim.studentroster.models.Contact;
import com.andrewkim.studentroster.models.Dormitory;
import com.andrewkim.studentroster.models.Student;
import com.andrewkim.studentroster.models.Class;
import com.andrewkim.studentroster.repositories.ClassRepository;
import com.andrewkim.studentroster.repositories.ContactRepository;
import com.andrewkim.studentroster.repositories.DormitoryRepository;
import com.andrewkim.studentroster.repositories.StudentRepository;

@Service
public class StudentRosterService {
	private final StudentRepository studentRepository;
	private final ContactRepository contactRepository;
	private final DormitoryRepository dormitoryRepository;
	private final ClassRepository classRepository;
	
	public StudentRosterService (StudentRepository studentRepository,
			ContactRepository contactRepository, DormitoryRepository dormitoryRepository,
			ClassRepository classRepository) {
		this.studentRepository = studentRepository;
		this.contactRepository = contactRepository;
		this.dormitoryRepository = dormitoryRepository;
		this.classRepository = classRepository;
	}
	
	public List <Student> allStudents() {
		return studentRepository.findAll();
	}
	
	public List <Contact> allContacts() {
		return contactRepository.findAll();
	}
	
	public List <Dormitory> allDormitories() {
		return dormitoryRepository.findAll();
	}
	
	public List <Class> allClasses() {
		return classRepository.findAll();
	}
	
	public Student createStudent(Student student) {
		return studentRepository.save(student);
	}
	
	public Contact createContact(Contact contact) {
		return contactRepository.save(contact);
	}
	
	public Dormitory createDormitory(Dormitory dormitory) {
		return dormitoryRepository.save(dormitory);
	}
	
	public Class createClass(Class c) {
		return classRepository.save(c);
	}
	
	public Student findStudent(Long id) {
		Optional<Student> optionalStudent = studentRepository.findById(id);
		if(optionalStudent.isPresent()) {
			return optionalStudent.get();
		}
		else {
			return null;
		}
	}
	
	public Dormitory findDormitory(Long id) {
		Optional<Dormitory> optionalDormitory = dormitoryRepository.findById(id);
		if (optionalDormitory.isPresent()) {
			return optionalDormitory.get();
		}
		else {
			return null;
		}
	}
	
	public Class findClass(Long id) {
		Optional<Class> optionalClass = classRepository.findById(id);
		if (optionalClass.isPresent()) {
			return optionalClass.get();
		}
		else {
			return null;
		}
	}
	
	public Student findStudentName(String name) {
		return studentRepository.findByName(name);
	}
	
	public Class findClassName(String name) {
		return classRepository.findByClassName(name);
	}
	
	public void deleteStudent (Long id) {
		studentRepository.deleteById(id);
	}
	
	public void deleteDormitory (Long id) {
		dormitoryRepository.deleteById(id);
	}
	
	public void deleteClass (Long id) {
		classRepository.deleteById(id);
	}
}
