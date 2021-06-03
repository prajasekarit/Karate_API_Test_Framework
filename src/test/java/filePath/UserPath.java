package filePath;

public class UserPath {

	
	public String systemPath() {
		String path = System.getProperty("user.dir");
		System.out.println("User Directory Path is: "+path);
		return path;
		
	}
}
