package com.andrewkim.studentroster.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.andrewkim.studentroster.models.Contact;
import com.andrewkim.studentroster.models.Dormitory;
import com.andrewkim.studentroster.models.Student;
import com.andrewkim.studentroster.models.Class;
import com.andrewkim.studentroster.services.StudentRosterService;

@Controller
public class StudentRosterController {
	private final StudentRosterService studentRosterService;
	
	public StudentRosterController(StudentRosterService studentRosterService) {
		this.studentRosterService = studentRosterService;
	}
	
	@RequestMapping("/")
	public String home() {
		return "home.jsp";
	}
	
	@RequestMapping("/students")
	public String studentList(Model model) {
		List<Student> students= studentRosterService.allStudents();
		model.addAttribute("students", students);
		return "students.jsp";
	}
	
	@RequestMapping("/students/secret")
	public String studentListSecret(Model model) {
		List<Student> students= studentRosterService.allStudents();
		model.addAttribute("students", students);
		return "studentsadv.jsp";
	}
	
	@RequestMapping("/students/new")
	public String createStudent(Model model, @ModelAttribute("student") Student student) {
		model.addAttribute("student", student);
		return "newstudent.jsp";
	}
	
	@RequestMapping(value = "/students/new/process", method = RequestMethod.POST)
	public String createPersonProcess(@Valid @ModelAttribute("student") Student student,
			BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "newstudent.jsp";
		}
		else {
			studentRosterService.createStudent(student);
			Long id = student.getId();
			session.setAttribute("id", id);
			return "redirect:/contact/new";
		}
	}
	
	@RequestMapping("/contact/new")
	public String createContact(Model model, @ModelAttribute("contact") Contact contact, HttpSession session) {
		model.addAttribute("contact", contact);
		Long id = (Long) session.getAttribute("id");
		Student student = studentRosterService.findStudent(id);
		model.addAttribute("student", student);
		return "newcontact.jsp";
	}
	
	@RequestMapping(value = "/contact/new/process", method = RequestMethod.POST)
	public String createContactProcess(@Valid @ModelAttribute("contact") Contact contact, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "newcontact.jsp";
		}
		else {
			studentRosterService.createContact(contact);
			model.addAttribute("contact", contact);
			return "redirect:/students";
		}
	}
	
	@RequestMapping("/students/edit/{id}")
	public String editStudent(Model model, @PathVariable("id") Long id) {
		Student student = studentRosterService.findStudent(id);
		model.addAttribute("student", student);
		return "editstudent.jsp";
	}
	
	@RequestMapping("/students/edit/{id}/process")
	public String editStudentProcess(@PathVariable("id") Long id, @RequestParam("name") String name,
			@RequestParam("age") String age, @RequestParam("address") String address,
			@RequestParam("city") String city, @RequestParam("state") String state,
			RedirectAttributes r) {
		int a = Integer.parseInt(age);
		if (name.length() < 2) {
			r.addFlashAttribute("error", "Name must be at least two characters long");
			return "redirect:/students/edit/" + id;
		}
		else if (a < 5) {
			r.addFlashAttribute("error", "You must be at least 5 years old to attend this school.");
			return "redirect:/students/edit/" + id;
		}
		else if (address.length() < 2) {
			r.addFlashAttribute("error", "Address must be at least two characters long");
			return "redirect:/students/edit/" + id;
		}
		else if (city.length() < 2) {
			r.addFlashAttribute("error", "City must be at least two characters long");
			return "redirect:/students/edit/" + id;
		}
		else if (state.length() < 2) {
			r.addFlashAttribute("error", "State must be at least two characters long");
			return "redirect:/students/edit/" + id;
		}
		else {
			Student student = studentRosterService.findStudent(id);
			student.setName(name);
			student.setAge(a);
			student.getContact().setAddress(address);
			student.getContact().setCity(city);
			student.getContact().setState(state);
			studentRosterService.createStudent(student);
			return "redirect:/students";
		}
	}
	
	@RequestMapping("/students/delete/{id}")
	public String deleteStudent(@PathVariable("id") Long id) {
		studentRosterService.deleteStudent(id);
		return "redirect:/students";
	}
	
	@RequestMapping("/dorms")
	public String dormitoryList(Model model) {
		List<Dormitory> dormitories = studentRosterService.allDormitories();
		model.addAttribute("dormitories", dormitories);
		return "dormitories.jsp";
	}
	
	@RequestMapping("/dorms/secret")
	public String dormitoryListSecret(Model model) {
		List<Dormitory> dormitories = studentRosterService.allDormitories();
		model.addAttribute("dormitories", dormitories);
		return "dormitoriesadv.jsp";
	}
	
	@RequestMapping(value = "/dorms/create", method = RequestMethod.POST)
	public String createDormitory(@RequestParam("name") String name, RedirectAttributes r) {
		if (name.length() < 2) {
			r.addFlashAttribute("error", "Dormitory name must be at least two characters long");
			return "redirect:/dorms";
		}
		else {
			Dormitory dormitory = new Dormitory();
			dormitory.setName(name);
			studentRosterService.createDormitory(dormitory);
			return "redirect:/dorms/" + dormitory.getId();
		}
	}
	
	@RequestMapping("/dorms/{id}")
	public String showDormitory (@PathVariable("id") Long id, Model model) {
		Dormitory dormitory = studentRosterService.findDormitory(id);
		model.addAttribute("dormitory", dormitory);
		List<Student> added = dormitory.getStudents();
		model.addAttribute("added", added);
		List<Student> allStudents = studentRosterService.allStudents();
		List<String> menu = new ArrayList<String>();
		for (int i = 0; i < allStudents.size(); i++) {
			String s = allStudents.get(i).getName();
			if (allStudents.get(i).getDormitory() == null) {
				menu.add(s);
			}
		}
		model.addAttribute("menu", menu);
		return "dormitory.jsp"; 
	}
	
	@RequestMapping("/dorms/{id}/addstudent")
	public String addStudentToDorm (@PathVariable("id") Long id, @RequestParam ("name") String s) {
		Dormitory dormitory = studentRosterService.findDormitory(id);
		Student student = studentRosterService.findStudentName(s);
		student.setDormitory(dormitory);
		studentRosterService.createStudent(student);
		return "redirect:/dorms/" + id;
	}
	
	@RequestMapping("/dorms/{d_id}/removestudent/{s_id}") 
	public String removeStudentFromDorm (@PathVariable("d_id") Long d_id, @PathVariable("s_id") Long s_id) {
		Student student = studentRosterService.findStudent(s_id);
		student.setDormitory(null);
		studentRosterService.createStudent(student);
		return "redirect:/dorms/" + d_id;
	}
	
	@RequestMapping("/dorms/edit/{id}")
	public String editDormitory(Model model, @PathVariable("id") Long id) {
		Dormitory dormitory = studentRosterService.findDormitory(id);
		model.addAttribute("dormitory", dormitory);
		return "editdormitory.jsp";
	}
	
	@RequestMapping(value = "/dorms/edit/{id}/process", method = RequestMethod.POST)
	public String editDormitoryProcess(@PathVariable("id") Long id, @RequestParam("name") String name,
			RedirectAttributes r) {
		if (name.length() < 2) {
			r.addFlashAttribute("error", "Dormitory name must be at least two characters long");
			return "redirect:/dorms/edit/" + id;
		}
		else {
			Dormitory dormitory = studentRosterService.findDormitory(id);
			dormitory.setName(name);
			studentRosterService.createDormitory(dormitory);
			return "redirect:/dorms/" + id;
		}
	}
	
	@RequestMapping("/dorms/delete/{id}")
	public String deleteDormitory(@PathVariable("id") Long id) {
		studentRosterService.deleteDormitory(id);
		return "redirect:/dorms";
	}
	
	@RequestMapping("/classes")
	public String classList(Model model) {
		List<Class> classes = studentRosterService.allClasses();
		model.addAttribute("classes", classes);
		return "classes.jsp";
	}
	
	@RequestMapping("/classes/secret")
	public String classListSecret(Model model) {
		List<Class> classes = studentRosterService.allClasses();
		model.addAttribute("classes", classes);
		return "classesadv.jsp";
	}
	
	@RequestMapping(value = "/classes/create", method = RequestMethod.POST)
	public String createClassProcess(@RequestParam("className") String className,
			@RequestParam("instructorName") String instructorName, RedirectAttributes r) {
		if (className.length() < 2) {
			r.addFlashAttribute("error", "Class name must be at least two characters long");
			return "redirect:/classes";
		}
		else if (instructorName.length() < 2) {
			r.addFlashAttribute("error", "Instructor name must be at least two characters long");
			return "redirect:/classes";
		}
		else {
			Class cla = new Class();
			cla.setClassName(className);
			cla.setInstructorName(instructorName);
			studentRosterService.createClass(cla);
			return "redirect:/classes/" + cla.getId();
		}
	}
	
	@RequestMapping("/classes/{id}")
	public String showClass (@PathVariable("id") Long id, Model model) {
		Class c = studentRosterService.findClass(id);
		model.addAttribute("c", c);
		List<Student> added = c.getStudents();
		model.addAttribute("added", added);
		
		List<Student> allStudents = studentRosterService.allStudents();
		List<Student> menu = new ArrayList<Student>();
		menu.addAll(allStudents);
		menu.removeAll(added);
		
		model.addAttribute("menu", menu);
		return "class.jsp";
	}
	
	@RequestMapping("/classes/edit/{id}")
	public String editClass(Model model, @PathVariable("id") Long id) {
		Class c = studentRosterService.findClass(id);
		model.addAttribute("c", c);
		return "editclass.jsp";
	}
	
	@RequestMapping(value = "/classes/edit/{id}/process", method = RequestMethod.POST)
	public String editClassProcess(@PathVariable("id") Long id, @RequestParam("className") String className,
			@RequestParam("instructorName") String instructorName, RedirectAttributes r) {
		if (className.length() < 2) {
			r.addFlashAttribute("error", "Class name must be at least two characters long");
			return "redirect:/classes/edit/" + id;
		}
		else if (instructorName.length() < 2) {
			r.addFlashAttribute("error", "Instructor name must be at least two characters long");
			return "redirect:/classes/edit/" + id;
		}
		else {
			Class c = studentRosterService.findClass(id);
			c.setClassName(className);
			c.setInstructorName(instructorName);
			studentRosterService.createClass(c);
			return "redirect:/classes/" + id;
		}
	}
	
	@RequestMapping("/classes/delete/{id}")
	public String deleteClass(@PathVariable("id") Long id) {
		studentRosterService.deleteClass(id);
		return "redirect:/classes";
	}
	
	@RequestMapping("students/{id}")
	public String showStudent(@PathVariable("id") Long id, Model model) {
		Student student = studentRosterService.findStudent(id);
		model.addAttribute("student", student);
		List<Class> added = student.getClasses();
		model.addAttribute("added", added);
		
		List<Class> allClasses = studentRosterService.allClasses();
		List<Class> menu = new ArrayList<Class>();
		menu.addAll(allClasses);
		menu.removeAll(added);
		
		model.addAttribute("menu", menu);
		return "studentinfo.jsp";
	}
	
	@RequestMapping("/students/{id}/addclass")
	public String addClassToStudent (@PathVariable("id") Long id, @RequestParam ("name") String cl) {
		Student student = studentRosterService.findStudent(id);
		Class c = studentRosterService.findClassName(cl);
		student.getClasses().add(c);
		studentRosterService.createStudent(student);
		return "redirect:/students/" + id;
	}
	
	@RequestMapping("/students/{student_id}/dropclass/{class_id}")
	public String removeClassFromStudent (@PathVariable("student_id") Long student_id,
			@PathVariable("class_id") Long class_id) {
		Student student = studentRosterService.findStudent(student_id);
		Class c = studentRosterService.findClass(class_id);
		student.getClasses().remove(c);
		studentRosterService.createStudent(student);
		return "redirect:/students/" + student_id;
	}
	
	@RequestMapping("/classes/{id}/addstudent")
	public String addStudentToClass (@PathVariable("id") Long id, @RequestParam ("name") String s) {
		Class c = studentRosterService.findClass(id);
		Student student = studentRosterService.findStudentName(s);
		c.getStudents().add(student);
		studentRosterService.createClass(c);
		return "redirect:/classes/" + id;
	}
	
	@RequestMapping("/classes/{class_id}/dropclass/{student_id}")
	public String removeStudentFromClass (@PathVariable("class_id") Long class_id,
			@PathVariable("student_id") Long student_id) {
		Class c = studentRosterService.findClass(class_id);
		Student student = studentRosterService.findStudent(student_id);
		c.getStudents().remove(student);
		studentRosterService.createClass(c);
		return "redirect:/classes/" + class_id;
	}
}
