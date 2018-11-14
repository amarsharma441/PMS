package models;

public class FacultyPointsRowMap 
{

	private String id;
	private int year_id;
	private int table_id; 
	private int row_id;
	private float expected_points;
	private float points_earned;   
	private String comment;         
	private String proof_filename;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getYear_id() {
		return year_id;
	}
	public void setYear_id(int year_id) {
		this.year_id = year_id;
	}
	public int getTable_id() {
		return table_id;
	}
	public void setTable_id(int table_id) {
		this.table_id = table_id;
	}
	public int getRow_id() {
		return row_id;
	}
	public void setRow_id(int row_id) {
		this.row_id = row_id;
	}
	public float getExpected_points() {
		return expected_points;
	}
	public void setExpected_points(float expected_points) {
		this.expected_points = expected_points;
	}
	public float getPoints_earned() {
		return points_earned;
	}
	public void setPoints_earned(float points_earned) {
		this.points_earned = points_earned;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getProof_filename() {
		return proof_filename;
	}
	public void setProof_filename(String proof_filename) {
		this.proof_filename = proof_filename;
	}
	
	
}
