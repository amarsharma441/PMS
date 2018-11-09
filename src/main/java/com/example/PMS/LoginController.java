package com.example.PMS;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.Faculty;

@Controller
public class LoginController
{
	private String SELECT_SQL = "SELECT * FROM facultydetails WHERE id=:id";
	
	//private  PmsFormController pmsformcontroller = new PmsFormController();
	
	private Faculty faculty;
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@RequestMapping("/login")   //Mapping to open LogIn page (/login)
	public String LogInPage()
	{	
		return "login.jsp";
	}
	
	
	public class FacultyMapper implements RowMapper 
	{  
		 public Faculty mapRow(ResultSet rs, int rowNum) throws SQLException
		 {  
			 Faculty f = new Faculty();  
			 f.setId(rs.getString("id"));  
			 f.setName(rs.getString("name")); 
			 f.setDesignation(rs.getString("designation"));
			 f.setDepartment(rs.getString("department"));
			 f.setQualifications(rs.getString("qualifications"));
			 f.setDob(rs.getString("dob"));
			 f.setDoj(rs.getString("doj"));
			 f.setAppraiser_name(rs.getString("appraiser_name"));
			 f.setPassword(rs.getString("password"));
			 return f;  
		 }  
	}  
	
	@RequestMapping("/login-dashboard")  //GETTING details from database after successfull login
	public ModelAndView CheckLogin(@RequestParam String id,@RequestParam String password)
	{
		boolean true_user;
		ModelAndView mv =null;
		
		System.out.println("ID ===="+id);  //FOR TESTING
		SqlParameterSource parameters = new MapSqlParameterSource().addValue("id", id);
		
		faculty = (Faculty) namedParameterJdbcTemplate.queryForObject(SELECT_SQL, parameters, new FacultyMapper());
		
		PmsFormController.setFaculty(faculty);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		true_user = passwordEncoder.matches(password,(faculty.getPassword()));
		
		if(true_user)
		{	
			mv = new ModelAndView("dashboard.jsp","obj",faculty);        
			return mv;
		}
		else
		{
			System.out.println("========WRONG PASSWORD");
			mv = new ModelAndView("login.jsp");
			return mv;
		}
	}
	
}

