
public class Student extends Person implements PublishDetails
{
	private int studentId;
	private String courseCode;
	
	public Student (String name, char gender, int studentId, String courseCode)
	{
		super(name, gender);
		this.studentId = studentId;
		this.courseCode = courseCode;
	}
	
	public String toString()
	{
		String output = super.toString() + "\nStudent Id: " + studentId + "\nCourse Code: " + courseCode; 
		return output;
	}
	
	public void confirmDetails()
	{
		System.out.println("Your name is: " + getName());
	}
	
	public void getCourseCode()
	{
		System.out.println("Your course code is " + courseCode);
	}

}
