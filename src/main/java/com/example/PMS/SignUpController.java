package com.example.PMS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import models.Faculty;


@Controller
public class SignUpController
{
	private String INSERT_SQL = "INSERT INTO facultydetails(id,name,designation,department,qualifications,dob,doj,appraiser_name,password) VALUES(:id,:name,:designation,:department,:qualifications,:dob,:doj,:appraiser_name,:password)";
	
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@RequestMapping("/signup")   //Mapping to open Signup page (/signup)
	public String SignUpPage()
	{	
		return "signup.jsp";
	}
	
	
	
	@RequestMapping("/signupsubmit")  //Inserting details in database after signup  
	public ModelAndView insertSignUp(Faculty faculty)
	{
		byte ROW_AFFECTED=0; 
		ModelAndView mv=null;
		String hashedPassword;
		
		if((faculty.getPassword()).equals(faculty.getConpassword()))
		{
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			hashedPassword = passwordEncoder.encode((faculty.getPassword()));
			
			SqlParameterSource parameters = new MapSqlParameterSource()
																.addValue("id", faculty.getId())
																.addValue("name", faculty.getName())
																.addValue("designation", faculty.getDesignation())
																.addValue("department", faculty.getDepartment())
																.addValue("qualifications", faculty.getQualifications())
																.addValue("dob", faculty.getDob())
																.addValue("doj", faculty.getDoj())
																.addValue("appraiser_name", faculty.getAppraiser_name())
		                                                        .addValue("password", hashedPassword);
															
			ROW_AFFECTED =(byte) namedParameterJdbcTemplate.update(INSERT_SQL, parameters);
			System.out.println("ROW AFFECTED = === = "+ROW_AFFECTED );			//TESTING
			System.out.println("================INSERTION SUCCESSFULL");
			if(ROW_AFFECTED >0)
			{
				 mv = new ModelAndView("dashboard.jsp","obj",faculty);   //USE OBJ IN dashboard.jsp TO DISPLAY DETAILS
				 return mv;
			}
			
		}
		else
		{
			System.out.println("=================PASSWORD MISMATCH");
            mv = new ModelAndView("signup.jsp");   //RETURNING TO THE signup page if Password MISmatch
			return mv;
			
		}
		return mv;
	}
}
