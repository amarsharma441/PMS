package com.example.PMS;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import models.Faculty;

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
	
	public int noofyears(HttpSession session)
	{
		Faculty faculty = (Faculty)session.getAttribute("obj");
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
}
