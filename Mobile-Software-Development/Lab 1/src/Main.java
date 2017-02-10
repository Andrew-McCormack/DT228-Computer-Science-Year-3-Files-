
public class Main 
{
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Person person1 = new Person("Mark", 'm');
		Person person2 = new Person("Alex", 'f');
		
		person1.setName("John");
		person2.setName("Jake");
		person1.setGender('m');
		person2.setGender('m');

		System.out.println("Name: " + person1.getName() + " | Gender: " + person1.getGender());
	    System.out.println("Name: " + person2.getName() + " | Gender: " + person2.getGender() + "\n\n");
	
	    System.out.println(person1.toString());
	    System.out.println(person2.toString());
	    
	    System.out.println("\n\n");
	    
	    Student student1 = new Student("George", 'm', 1356, "DT228");
	    System.out.println(student1.toString());
	    
	    student1.confirmDetails();
	    student1.getCourseCode();
	}

}
