
public class Person 
{
	private String name;
	private char gender;
	

	public Person(String name, char gender)
	{
		this.name = name;
		this.gender = gender;
	}
	
	public String getName()
	{
		return name;
	}
	
	public char getGender()
	{
		return gender;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public void setGender(char gender)
	{
		this.gender = gender;
	}
	
	public String toString()
	{
		String output = ("Name of person: " + name + "\nGender of person " + gender);
		return output;
	}
	
}
