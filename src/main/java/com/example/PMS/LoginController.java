package com.example.PMS;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

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
public class LoginController extends Functions
{
	private String SELECT_SQL = "SELECT * FROM facultydetails WHERE id=:id";
	
	private Faculty faculty;
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@RequestMapping("/login")   //Mapping to open LogIn page (/login)
	public String LogInPage(HttpSession session)
	{	
		if(isLoggedIn(session))
		{
			
			return "redirect:dashboard";
		}
		else
		{
			return "login.jsp";
		}
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
	public String CheckLogin(@RequestParam String id,@RequestParam String password , HttpSession session)
	{
		
		boolean true_user;
		ModelAndView mv =null;
		
		if(!(isLoggedIn(session)))
		{
			System.out.println("ID ===="+id);  //FOR TESTING
			SqlParameterSource parameters = new MapSqlParameterSource().addValue("id", id);
			
			faculty = (Faculty) namedParameterJdbcTemplate.queryForObject(SELECT_SQL, parameters, new FacultyMapper());
		
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			true_user = passwordEncoder.matches(password,(faculty.getPassword()));
			
			if(true_user)
			{	
				AddInSession(faculty ,session);
				return "redirect:dashboard";
			}
			else
			{
				System.out.println("========WRONG PASSWORD");
				return "redirect:login";
			}
		}
		else
		{
			System.out.println("========ALREADY LOGGED IN");
			return "redirect:dashboard";
		}
	}
	
	@RequestMapping("/dashboard")   //Mapping to open LogIn page (/login)
	public ModelAndView dashboard(HttpSession session)
	{	
		if(isLoggedIn(session))
		{
			
			return new ModelAndView("dashboard.jsp","obj",session.getAttribute("obj"));
		}
		else
		{
			return new ModelAndView("login.jsp");
		}
	}
	
	private void  AddInSession(Faculty f ,HttpSession session)
	{
		session.setAttribute("obj" , f);
	}
}

