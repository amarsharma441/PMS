package models;

public class WeightDetails 
{
	private float academics_weight;
	private float research_weight;
	private float administration_weight;
	
	public WeightDetails() 
	{
		
	}

	public WeightDetails( float academics_weight, float research_weight,float administration_weight) 
	{
		this.academics_weight = academics_weight;
		this.research_weight = research_weight;
		this.administration_weight = administration_weight;
	}

	public float getAcademics_weight() {
		return academics_weight;
	}

	public void setAcademics_weight(float academics_weight) {
		this.academics_weight = academics_weight;
	}

	public float getResearch_weight() {
		return research_weight;
	}

	public void setResearch_weight(float research_weight) {
		this.research_weight = research_weight;
	}

	public float getAdministration_weight() {
		return administration_weight;
	}

	public void setAdministration_weight(float administration_weight) {
		this.administration_weight = administration_weight;
	}
	

}
