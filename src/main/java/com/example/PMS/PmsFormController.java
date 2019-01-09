package com.example.PMS;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.lang.String;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import models.Faculty;
import models.FacultyPointsRowMap;
import models.TableRowsMap;
import models.WeightDetails;

@Controller
public class PmsFormController extends Functions
{
	
	int y_id;      
	
	private String INSERT_SQL = "INSERT INTO weightdetails(id,year_id,academics_weight,research_weight,administration_weight)"
								+ "VALUES(:id,:year_id,:academics_weight,:research_weight,:administration_weight)";
	
	private String SELECT_SQL_1 = "select * from academicdetails";
	private String SELECT_SQL_2 = "select * from researchdetails";
	private String SELECT_SQL_3 = "select * from administrationdetails";
	
	private Faculty faculty;
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	
	@RequestMapping("/pmsform")
	public String pmsform(HttpSession session,HttpServletRequest request )
	{	
		faculty = (Faculty)session.getAttribute("obj");
		SqlParameterSource namedParameters = new MapSqlParameterSource();
		
		int noofyears = (int) noofyears(session);
		try
		{
			y_id =(int) Integer.parseInt(request.getParameter("year_id"));
		}
		catch(NumberFormatException n)
		{
			System.out.println("YEAR IIIIIIIIIDDDDDDDDD======="+ y_id + n);
		}
		finally
		{
			if(noofyears < y_id)
			{
				String UPDATE_SQL ="UPDATE noofyears SET years=:years WHERE id=:id";
				((MapSqlParameterSource) namedParameters).addValue("id", faculty.getId());
				((MapSqlParameterSource) namedParameters).addValue("years", y_id);
				namedParameterJdbcTemplate.update(UPDATE_SQL,namedParameters);
				session.setAttribute("years",y_id);
			}
		
			if(isLoggedIn(session))
				return "pmsform.jsp";
			else
				return "redirect:login";
		}
	}
	
	
	@RequestMapping("/updateform")
	public String updateform(HttpSession session)
	{	
		if(isLoggedIn(session))
			return "updateform.jsp";
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
	public String select_criteria(HttpServletRequest request , HttpSession session) throws ServletException, IOException
	{
		int table_id=0;	
		List<TableRowsMap> trm = new ArrayList<TableRowsMap>();
			
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
				table_id = 1;
				System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAA");
				session.removeAttribute("table_id");
				System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbb");
				session.setAttribute("table_id",table_id);
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
				table_id = 2;
				session.removeAttribute("table_id");
				session.setAttribute("table_id",table_id);
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
				table_id = 3;
				session.removeAttribute("table_id");
				session.setAttribute("table_id",table_id);
			}
			
			System.out.println("TABLE  ID ======"+session.getAttribute("table_id"));
			//**************************************************************************************************************************
			boolean points = isPointsExist(session);
			System.out.println("POINT EXIST =====" + points);
			
			//**************************************************************************************************************************			
			session.setAttribute("trm",trm);
			
			return "redirect:updateform";  //WILL CHANGE IT LATER		      
	}
	
	@RequestMapping("/updatepoints")
	public String update_points(@RequestParam("files") MultipartFile[] files,HttpServletRequest request , HttpSession session) throws ServletException, IOException
	{		
			String UPDATE_SQL;
			String UPLOADED_FOLDER = "F://files//";
			int table_id = (int)session.getAttribute("table_id");
			//int year_id =1;
			faculty = (Faculty)session.getAttribute("obj");
			System.out.println("Object -ID IN SESSION ===" + faculty.getId());
			SqlParameterSource parameters;
			
			List<TableRowsMap> trm = (List<TableRowsMap>) session.getAttribute("trm");
			
			
			if(isPointsExist(session)== true)
			{
				List<FacultyPointsRowMap> fprm = (List<FacultyPointsRowMap>) session.getAttribute("fprm");
				String INSERT_SQL;
				String filename=null;
				int ROW_AFFECTED;
				int j=0; 
				SqlParameterSource namedParameters = new MapSqlParameterSource();
				for(int i=0 ;i<fprm.size() ;i++ )
				{	
					if(!(fprm.get(i).getProof_filename().isEmpty()))
					{ 
						filename = fprm.get(i).getProof_filename();
						((MapSqlParameterSource) namedParameters).addValue("proof_filename",filename);
					}
					else if(!(files[j].getOriginalFilename().isEmpty()))
					{
						try 
							{
								byte[] bytes = files[j].getBytes();
								Path path = Paths.get(UPLOADED_FOLDER + files[j].getOriginalFilename());
								Files.write(path, bytes);
								filename =  files[j].getOriginalFilename();
								((MapSqlParameterSource) namedParameters).addValue("proof_filename",filename);
								j++;
								System.out.println("FILE NAME  ===="+ filename);        ///TESTING
							} 
        
						catch (IOException e)
						{
							e.printStackTrace();
						}
					}
					else
					{
						filename ="";
						((MapSqlParameterSource) namedParameters).addValue("proof_filename",filename);
						j++;
					}
					
					
					UPDATE_SQL ="UPDATE facultypoints SET expected_points=:expected_points ,comment=:comment,proof_filename=:proof_filename "
							  + "WHERE id=:id AND year_id=:year_id AND table_id=:table_id AND row_id=:row_id";
					((MapSqlParameterSource) namedParameters).addValue("expected_points",request.getParameter("ep_row"+(i+1)));
					((MapSqlParameterSource) namedParameters).addValue("comment", request.getParameter("comment_row"+(i+1)));
					((MapSqlParameterSource) namedParameters).addValue("id", faculty.getId());
					((MapSqlParameterSource) namedParameters).addValue("year_id", y_id);
					((MapSqlParameterSource) namedParameters).addValue("table_id", table_id);
					((MapSqlParameterSource) namedParameters).addValue("row_id", i+1);
					//((MapSqlParameterSource) namedParameters).addValue("proof_filename",filename);
				    ROW_AFFECTED =(byte) namedParameterJdbcTemplate.update(UPDATE_SQL, namedParameters);
				}
			}
			else
			{
				String INSERT_SQL="INSERT INTO facultypoints(id,year_id,table_id,row_id,expected_points,comment,proof_filename)"
						+ " VALUES(:id,:year_id,:table_id,:row_id,:expected_points,:comment,:proof_filename)";
				
				
				System.out.println("ROWS  "+trm.size());
				int ROW_AFFECTED=0;
				float expected_points;
				String comment;
				for(int i=0 ;i<trm.size();i++)
				{
					if(!(request.getParameter("ep_row"+(i+1)).isEmpty())  )
					{	
						expected_points = Float.parseFloat(request.getParameter("ep_row"+(i+1)));
						System.out.println(expected_points);
						parameters = new MapSqlParameterSource()
											 				.addValue("id", faculty.getId())
															.addValue("year_id", y_id)
															.addValue("table_id", table_id)
															.addValue("row_id", i+1)
															.addValue("expected_points", expected_points)
															.addValue("comment", request.getParameter("comment_row"+(i+1)))
															.addValue("proof_filename",files[i].getOriginalFilename());
						try 
				        {

				            // Get the file and save it somewhere
				            byte[] bytes = files[i].getBytes();
				            Path path = Paths.get(UPLOADED_FOLDER + files[i].getOriginalFilename());
				            Files.write(path, bytes);

				            String filename =  files[i].getOriginalFilename();
				            System.out.println("FILE NAME  ===="+ filename);        ///TESTING
				        } 
				        
				        catch (IOException e)
				        {
				            e.printStackTrace();
				        }
													
				    ROW_AFFECTED +=(byte) namedParameterJdbcTemplate.update(INSERT_SQL, parameters);
					}
					else if(request.getParameter("ep_row"+(i+1)).isEmpty())
					{
						expected_points = 0;
						parameters = new MapSqlParameterSource()
											 				.addValue("id", faculty.getId())
															.addValue("year_id", y_id)
															.addValue("table_id", table_id)
															.addValue("row_id", i+1)
															.addValue("expected_points", expected_points)
															.addValue("comment",  request.getParameter("comment_row"+(i+1)))
															.addValue("proof_filename",files[i].getOriginalFilename());
						try 
				        {

				            // Get the file and save it somewhere
				            byte[] bytes = files[i].getBytes();
				            Path path = Paths.get(UPLOADED_FOLDER + files[i].getOriginalFilename());
				            Files.write(path, bytes);

				            String filename =  files[i].getOriginalFilename();
				            System.out.println("FILE NAME  ===="+ filename);        ///TESTING
				        } 
				        
				        catch (IOException e)
				        {
				            e.printStackTrace();
				        }
						
						ROW_AFFECTED +=(byte) namedParameterJdbcTemplate.update(INSERT_SQL, parameters);
					}
				}
				System.out.println("ROWS AFFECTED "+ROW_AFFECTED);
				  //WILL CHANGE IT LATER		      
			 }
			return "redirect:pmsform";
		}
	

	@RequestMapping("/download")
	public void downloadPDFResource(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException 
	{
		String UPLOADED_FOLDER = "F:/files/";
		File file = new File(UPLOADED_FOLDER + request.getParameter("filename"));
		System.out.println("FFFFFFFFFFFFFFFFFFFFFFFF"+request.getParameter("filename"));
		if (file.exists()) 
		{
			String mimeType = URLConnection.guessContentTypeFromName(file.getName());
			if (mimeType == null)
			{
								mimeType = "application/octet-stream";
			}

			response.setContentType(mimeType);

			
			response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

			response.setContentLength((int) file.length());

			InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

			FileCopyUtils.copy(inputStream, response.getOutputStream());

		}
	}

	
	
	public boolean isPointsExist(HttpSession session)
	{
		int table_id = (int)session.getAttribute("table_id");
		faculty = (Faculty)session.getAttribute("obj");
		//int year_id =1;
		System.out.println("Object -ID IN SESSION ===" + faculty.getId());
		System.out.println("TABLE  ID ======"+table_id);
		String SELECT_SQL_1 = "SELECT * FROM facultypoints WHERE id='"+faculty.getId()+"' AND year_id='"+y_id+"' AND table_id='"+table_id+"'";
		System.out.println("SQL"+SELECT_SQL_1);
		
		List<FacultyPointsRowMap> fprm = new ArrayList<FacultyPointsRowMap>();
		
		if(session.getAttribute("fprm")!=null)
		{
			session.removeAttribute("fprm");
		}
		
		try
		{
			fprm= namedParameterJdbcTemplate.query(SELECT_SQL_1,
				
				new RowMapper<FacultyPointsRowMap>() 
				{
			        public FacultyPointsRowMap mapRow(ResultSet rs, int rowNum) throws SQLException 
			        {
			        	FacultyPointsRowMap fp = new FacultyPointsRowMap();
			        	fp.setId(rs.getString("id"));
			        	fp.setYear_id(rs.getInt("year_id"));
			        	fp.setTable_id(rs.getInt("table_id"));
			            fp.setRow_id(rs.getInt("row_id"));
			            fp.setExpected_points(rs.getFloat("expected_points"));
			            fp.setPoints_earned(rs.getFloat("points_earned"));
			            fp.setComment(rs.getString("comment"));
			            fp.setProof_filename(rs.getString("proof_filename"));

			            return fp;
			        }
				});
		}
		finally
		{
			System.out.println("SIZE ========"+fprm.size());
			if(fprm.size() == 0)
			{
				return false;

			}
			else
			{
				session.setAttribute("fprm",fprm);
				return true;
			}
		}
		
	}
}




