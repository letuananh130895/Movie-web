package Bean;

public class Contact {
	
	private int id;
	private String name;
	private String email;
	private String message;
	private String time;
    
    public Contact() {
         
    }
    
    public Contact(String name, String email, String message) {
        this.name=name;
    	this.email=email;
    	this.message=message;
    }
    
    public int getId() {
    	return id;
    }
    
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getMessage() {
        return message;
    }
 
    public void setMessage(String message) {
        this.message = message;
    }
    
    public String getTime() {
        return time;
    }
 
    public void setTime(String time) {
        this.time = time;
    }
}
