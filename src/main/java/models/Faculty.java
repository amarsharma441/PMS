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
	private String password;
	private String conpassword;
	
	public Faculty()
	{}
	public Faculty(String id, String name, String designation, String department, String qualifications, String dob,
			String doj, String appraiser_name, String password, String conpassword) 
	{
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.department = department;
		this.qualifications = qualifications;
		this.dob = dob;
		this.doj = doj;
		this.appraiser_name = appraiser_name;
		this.password = password;
		this.conpassword = conpassword;
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
	public String getPassword() {
		return password;
	}
	public String getConpassword() {
		return conpassword;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public void setQualifications(String qualifications) {
		this.qualifications = qualifications;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public void setAppraiser_name(String appraiser_name) {
		this.appraiser_name = appraiser_name;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setConpassword(String conpassword) {
		this.conpassword = conpassword;
	}
	
}
