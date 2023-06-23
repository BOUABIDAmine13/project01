package metier.entities;

import java.util.List;

public class User {
	private Long id_user;
	private String nom;
	private String email;
	private String motpass;
	private String urlImg;
	private String uType;
	private List<Produit> listProduits;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String nom, String email, String motpass, String uType) {
		super();
		this.nom = nom;
		this.email = email;
		this.motpass = motpass;
		this.uType = uType;
	}
	public User(String nom, String email, String motpass) {
		super();
		this.nom = nom;
		this.email = email;
		this.motpass = motpass;
	}
	
	public User(Long id_user,String nom, String urlImg) {
		super();
		this.id_user = id_user;
		this.nom = nom;
		this.urlImg = urlImg;
	}

	public String getuType() {
		return uType;
	}

	public void setuType(String uType) {
		this.uType = uType;
	}

	public Long getId_user() {
		return id_user;
	}
	public void setId_user(Long id_user) {
		this.id_user = id_user;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMotpass() {
		return motpass;
	}
	public void setMotpass(String motpass) {
		this.motpass = motpass;
	}
	public String getUrlImg() {
		return urlImg;
	}
	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	
	public List<Produit> addProduit(Produit p){
		this.listProduits.add(p);
		return this.listProduits;
	}
	
}
