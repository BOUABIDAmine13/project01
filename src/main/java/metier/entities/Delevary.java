package metier.entities;

public class Delevary {
	private Long id_delevery;
	private String firtName;
	private String lastName;
	private String compenyName;
	private String address;
	private String email;
	private double prix;
	public Delevary() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Delevary(String firtName, String lastName, String compenyName, String address, String email, double prix) {
		super();
		this.firtName = firtName;
		this.lastName = lastName;
		this.compenyName = compenyName;
		this.address = address;
		this.email = email;
		this.prix = prix;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public Long getId_delevery() {
		return id_delevery;
	}
	public void setId_delevery(Long id_delevery) {
		this.id_delevery = id_delevery;
	}
	public String getFirtName() {
		return firtName;
	}
	public void setFirtName(String firtName) {
		this.firtName = firtName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCompenyName() {
		return compenyName;
	}
	public void setCompenyName(String compenyName) {
		this.compenyName = compenyName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
