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
import models.WeightDetails;

@Controller
public class PmsFormController 
{
	
	private int y_id =1;       //Will change it later
	
	private String INSERT_SQL = "INSERT INTO weightdetails(id,year_id,academics_weight,research_weight,administration_weight)"
								+ "VALUES(:id,:year_id,:academics_weight,:research_weight,:administration_weight)";
	private static Faculty faculty;
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	
	public static void setFaculty(Faculty f)
	{
		faculty = f;
	}
	@RequestMapping("/pmsform")
	public String pmsform()
	{	
		return "pmsform.jsp";
	}
	
	@RequestMapping("/setweight")
	public void set_weight(WeightDetails wd)
	{
			byte ROW_AFFECTED=0; 
				
				SqlParameterSource parameters = new MapSqlParameterSource()
																	.addValue("id", faculty.getId())
																	.addValue("year_id", y_id)                   ////Will change it later
																	.addValue("academics_weight", wd.getAcademics_weight())
																	.addValue("research_weight", wd.getResearch_weight())
			                                                        .addValue("administration_weight", wd.getAdministration_weight());
																
				ROW_AFFECTED =(byte) namedParameterJdbcTemplate.update(INSERT_SQL, parameters);
				System.out.println("ROW AFFECTED = === = "+ROW_AFFECTED );			//TESTING
				
			if(ROW_AFFECTED >0)
			{
				System.out.println("================INSERTION SUCCESSFULL");
			}
			else
			{
				System.out.println("================INSERTION UNSUCCESSFULL");
				
			}
		}
	}
