package metier.entities;

public class Produit {
	private Long id_produit;
	private String designation;
	private double prix;
	private int quantite_stock;
	private int quantite_achte;
	private String categorie;
	private String urlImg;
	public Produit() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Produit(String designation, double prix, int quantite_stock, String categorie) {
		super();
		this.designation = designation;
		this.prix = prix;
		this.quantite_stock = quantite_stock;
		this.quantite_achte = 0;
		this.categorie = categorie;
	}

	public Long getId_produit() {
		return id_produit;
	}
	public void setId_produit(Long id_produit) {
		this.id_produit = id_produit;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getQuantite_stock() {
		return quantite_stock;
	}
	public void setQuantite_stock(int quantite_stock) {
		this.quantite_stock = quantite_stock;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public String getUrlImg() {
		return urlImg;
	}
	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	public int getQuantite_achte() {
		return quantite_achte;
	}
	public void setQuantite_achte(int quantite_achte) {
		this.quantite_achte = quantite_achte;
	}
	
}
