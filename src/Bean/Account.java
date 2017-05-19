package Bean;

public class Account {
	
	private String userName;
    private String password;
    private String email;
    private int point;
    private String time;
    private String per;
    
    public Account() {
         
    }
    
    public Account(String userName, String password, String email) {
        this.userName=userName;
    	this.password=password;
        this.email=email;
    }
    
    public Account(String userName, String password, String email, int point, String time, String per) {
        this.userName=userName;
    	this.password=password;
        this.email=email;
        this.point=point;
    	this.time=time;
        this.per=per;
    }
     
    public String getUserName() {
        return userName;
    }
 
    public void setUserName(String userName) {
        this.userName = userName;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
    
    public int getPoint() {
        return point;
    }
 
    public void setPoint(int point) {
        this.point = point;
    }
    
    public String getTime() {
        return time;
    }
 
    public void setTime(String time) {
        this.time = time;
    }
    
    public String getPer() {
        return per;
    }
    
    public void setPer(String per) {
        this.per = per;
    }

}
