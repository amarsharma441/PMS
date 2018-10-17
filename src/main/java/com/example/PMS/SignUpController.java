package com.example.PMS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.Faculty;


@Controller
public class SignUpController
{
	private String INSERT_SQL = "INSERT INTO facultydetails(id,name,designation,department,qualifications,dob,doj,appraiser_name) VALUES(:id,:name,:designation,:department,:qualifications,:dob,:doj,:appraiser_name)";
	
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@RequestMapping("/signup")   //Mapping to open Signup page (/signup)
	public String hello()
	{	
		return "signup.jsp";
	}
	
	@RequestMapping("/signupsubmit")  //Inserting details in database after signup  
	public ModelAndView insertSignUp(Faculty faculty)
	{
		System.out.println("DEPT ================"+faculty.getDepartment());
		SqlParameterSource parameters = new MapSqlParameterSource()
																.addValue("id", faculty.getId())
																.addValue("name", faculty.getName())
																.addValue("designation", faculty.getDesignation())
																.addValue("department", faculty.getDepartment())
																.addValue("qualifications", faculty.getQualifications())
																.addValue("dob", faculty.getDob())
																.addValue("doj", faculty.getDoj())
																.addValue("appraiser_name", faculty.getAppraiser_name());
																
																
		 namedParameterJdbcTemplate.update(INSERT_SQL, parameters);
		
		 ModelAndView mv = new ModelAndView("dashboard.jsp","obj",faculty);   //USE OBJ IN dashboard.jsp TO DISPLAY DETAILS
		
		 return mv;   	
		
	}
}
