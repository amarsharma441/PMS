package models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Faculty 
{
	@Id
	private String id;           //Faculty ID (UNIQUE)
	private String name;     
	private String designation;
	private String department;
	private String qualifications;    
	private String dob;               //DATE OF BIRTH
	private String doj;               //DATE OF JOINING
	private String appraiser_name;
	
	
	
	public Faculty(String id, String name, String designation, String department, String qualifications, String dob,
			String doj, String appraiser_name)
	{
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.department = department;
		this.qualifications = qualifications;
		this.dob = dob;
		this.doj = doj;
		this.appraiser_name = appraiser_name;
	}
	public String getId()
	{
		return id;
	}
	public String getName() 
	{
		return name;
	}
	public String getDesignation()
	{
		return designation;
	}
	public String getDepartment() 
	{
		return department;
	}
	public String getQualifications() 
	{
		return qualifications;
	}
	public String getDob()
	{
		return dob;
	}
	public String getDoj()
	{
		return doj;
	}
	public String getAppraiser_name()
	{
		return appraiser_name;
	}
	
}
