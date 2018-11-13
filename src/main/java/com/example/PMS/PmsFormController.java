package com.example.PMS;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;                
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import models.Faculty;
import models.TableRowsMap;
import models.WeightDetails;

@Controller
public class PmsFormController extends Functions
{
	
	private  int y_id =1;       //Will change it later
	
	private String INSERT_SQL = "INSERT INTO weightdetails(id,year_id,academics_weight,research_weight,administration_weight)"
								+ "VALUES(:id,:year_id,:academics_weight,:research_weight,:administration_weight)";
	
	private String SELECT_SQL_1 = "select * from academicdetails";
	private String SELECT_SQL_2 = "select * from researchdetails";
	private String SELECT_SQL_3 = "select * from administrationdetails";
	
	private Faculty faculty;
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@RequestMapping("/pmsform")
	public String pmsform(HttpSession session)
	{	
		if(isLoggedIn(session))
			return "pmsform.jsp";
		else
			return "redirect:login";
	}
	
	
	
	@RequestMapping("/setweight")
	public String set_weight(WeightDetails wd , HttpSession session)
	{
			byte ROW_AFFECTED=0;
			
			faculty = (Faculty)session.getAttribute("obj");
			System.out.println("Object -ID IN SESSION ===" + faculty.getId());
			
			if(wd.getAcademics_weight()+wd.getResearch_weight()+wd.getAdministration_weight() == 1)
			{
				SqlParameterSource parameters = new MapSqlParameterSource()
																	.addValue("id",faculty.getId())
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
			
				return "redirect:pmsform";
			}
			
			else
			{
				System.out.println("================INSERTION UNSUCCESSFULL ( sum is != 1 )");
				return "redirect:pmsform";  //WILL CHANGE IT LATER
			}
		}
	
	@RequestMapping("/selectcriteria")
	public String select_criteria(HttpServletRequest request , HttpSession session ) throws ServletException, IOException
	{
			
		List<TableRowsMap> trm = new ArrayList<TableRowsMap>();
		
			faculty = (Faculty)session.getAttribute("obj");
			System.out.println("Object -ID IN SESSION ===" + faculty.getId());
			
			System.out.println(request.getParameter("tablename"));
			
			
			if(request.getParameter("tablename").equals("Academics and Academic Administration"))
			{
				trm= namedParameterJdbcTemplate.query(SELECT_SQL_1,
						
						new RowMapper<TableRowsMap>() 
						{
					        public TableRowsMap mapRow(ResultSet rs, int rowNum) throws SQLException 
					        {
					        	TableRowsMap t = new TableRowsMap();
					            t.setRow_id(rs.getInt("row_id"));
					            t.setParameter(rs.getString("parameter"));
					            t.setMaximum_points(rs.getInt("maximum_points"));

					            return t;
					        }
						});
			}
			else if(request.getParameter("tablename").equals("Research and Consultancy"))
			{
				trm= namedParameterJdbcTemplate.query(SELECT_SQL_2,
						
						new RowMapper<TableRowsMap>() 
						{
					        public TableRowsMap mapRow(ResultSet rs, int rowNum) throws SQLException 
					        {
					        	TableRowsMap t = new TableRowsMap();
					            t.setRow_id(rs.getInt("row_id"));
					            t.setParameter(rs.getString("parameter"));
					            t.setMaximum_points(rs.getInt("maximum_points"));

					            return t;
					        }
						});
			}
			else if(request.getParameter("tablename").equals("Administration"))
			{
				trm= namedParameterJdbcTemplate.query(SELECT_SQL_3,
						
				new RowMapper<TableRowsMap>() 
				{
			        public TableRowsMap mapRow(ResultSet rs, int rowNum) throws SQLException 
			        {
			        	TableRowsMap t = new TableRowsMap();
			            t.setRow_id(rs.getInt("row_id"));
			            t.setParameter(rs.getString("parameter"));
			            t.setMaximum_points(rs.getInt("maximum_points"));

			            return t;
			        }
				});
			
			}
			
			session.setAttribute("trm",trm);
			
			for(TableRowsMap t : trm)
			{
				System.out.println(t.getRow_id() +"   "+ t.getParameter() +"   " + t.getMaximum_points());
			}
			return "redirect:pmsform";  //WILL CHANGE IT LATER		      
			
			
	}
}




