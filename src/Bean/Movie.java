package Bean;

public class Movie {
	
	private int id;
	private String name;
    private String img;
    private int year;
    private String type;
    private String des;
    private String url;
    private int view;
 
    public Movie() {
 
    }
 
    public Movie(String name, String img, int year, String type, String des, String url, int view) {
        this.name=name;
        this.img=img;
        this.year=year;
        this.type=type;
        this.des=des;
        this.url=url;
        this.view=view;
        }
    
    public Movie(int id, String name, String img, int year, String type, String des, String url, int view) {
        this.id=id;
    	this.name=name;
        this.img=img;
        this.year=year;
        this.type=type;
        this.des=des;
        this.url=url;
        this.view=view;
    }
    
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id=id;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name=name;
    }
    
    public String getImg() {
        return img;
    }
 
    public void setImg(String img) {
        this.img=img;
    }
    
    public int getYear() {
        return year;
    }
 
    public void setYear(int year) {
        this.year=year;
    }
    
    public String getType() {
        return type;
    }
 
    public void setType(String type) {
        this.type=type;
    }
    
    public String getDes() {
        return des;
    }
 
    public void setDes(String des) {
        this.des=des;
    }
    
    public String getUrl() {
        return url;
    }
 
    public void setUrl(String url) {
        this.url=url;
    }
    
    public int getView() {
        return view;
    }
 
    public void setView(int view) {
        this.view=view;
    }
    
 }
