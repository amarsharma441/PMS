package com.example.PMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import models.Faculty;
import models.FacultyPointsRowMap;
import models.WeightDetails;

public class Functions 
{
	public boolean isLoggedIn(HttpSession session)
	{
		if(session.getAttribute("obj") != null)
		{
			return true;
		}
		
		else
		{
			return false;
		}
	}
	
	public int noofyears;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	Faculty faculty;
	
	public int noofyears(HttpSession session)
	{
		faculty = (Faculty)session.getAttribute("obj");
		String SQL = "SELECT * FROM noofyears WHERE id=:id";
		SqlParameterSource parameters1 = new MapSqlParameterSource()
				.addValue("id",faculty.getId());
		
		
		namedParameterJdbcTemplate.query(SQL,parameters1,
				
				new RowMapper() 
				{
			        public Object mapRow(ResultSet rs, int rowNum) throws SQLException 
			        {
			          noofyears = (int) rs.getInt("years");
			          session.setAttribute("years",noofyears);
			          return faculty; //no use
			        }
				});
		return noofyears;
	}
	
	public List<WeightDetails> isWeightsExists(int y_id)
	{
		
		String SQL = "SELECT * FROM weightdetails WHERE id=:id AND year_id=:year_id";
		SqlParameterSource parameters1 = new MapSqlParameterSource()
				.addValue("id",faculty.getId())
				.addValue("year_id",y_id);
		
		List<WeightDetails> wdrm = new ArrayList<WeightDetails>();
		wdrm.clear();
			wdrm= namedParameterJdbcTemplate.query(SQL,parameters1,
				
				new RowMapper<WeightDetails>() 
				{
			        public WeightDetails mapRow(ResultSet rs, int rowNum) throws SQLException 
			        {
			        	WeightDetails wd = new WeightDetails();
			        	
			            wd.setAcademics_weight(rs.getFloat("academics_weight"));
			            wd.setResearch_weight(rs.getFloat("research_weight"));
			            wd.setAdministration_weight(rs.getFloat("administration_weight"));
			            System.out.println("WDDDDDDDDDDDDD"+wd.getAcademics_weight()+wd.getAdministration_weight()+wd.getResearch_weight());
			            return wd;
			        }
				});
		return wdrm;
			
	}
}
