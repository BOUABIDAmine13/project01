package metier.entities;

import java.time.LocalDate;
import java.util.List;

public class Command {
	private Long id_command;
	private Long id_client;
	private String clientName;
	private Long id_produits;
	private String produitNome;
	private int quantite;
	private LocalDate date;
	private String adress;
	private Long id_shipping;
	private String delevaryNome;
	private List<Produit> products;
	private String paymentType;
	private double pPrix;
	private double sPrix;
	private double tPrix;
	public Command() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Command(Long id_client, Long id_produits, Long id_shipping, int quantite, LocalDate date, String adress, String paymentType, double pPrix, double sPrix) {
		super();
		this.id_client = id_client;
		this.id_produits = id_produits;
		this.quantite = quantite;
		this.date = date;
		this.id_shipping = id_shipping;
		this.adress= adress;
		this.paymentType = paymentType;
		this.pPrix = pPrix;
		this.sPrix = sPrix;
		this.tPrix = pPrix+sPrix;
	}
	
	public Command(Long id_command, String clientName, String produitNome, int quantite, LocalDate date, String adress,
			String delevaryNome) {
		super();
		this.id_command = id_command;
		this.clientName = clientName;
		this.produitNome = produitNome;
		this.quantite = quantite;
		this.date = date;
		this.adress = adress;
		this.delevaryNome = delevaryNome;
	}
	public Long getId_command() {
		return id_command;
	}
	public void setId_command(Long id_command) {
		this.id_command = id_command;
	}
	public Long getId_client() {
		return id_client;
	}
	public void setId_client(Long id_client) {
		this.id_client = id_client;
	}
	public Long getId_produits() {
		return id_produits;
	}
	public void setId_produits(Long id_produits) {
		this.id_produits = id_produits;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public List<Produit> getProducts() {
		return products;
	}
	public void setProducts(List<Produit> products) {
		this.products = products;
	}
	public Long getId_shipping() {
		return id_shipping;
	}
	public void setId_shipping(Long id_shipping) {
		this.id_shipping = id_shipping;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getProduitNome() {
		return produitNome;
	}
	public void setProduitNome(String produitNome) {
		this.produitNome = produitNome;
	}
	public String getDelevaryNome() {
		return delevaryNome;
	}
	public void setDelevaryNome(String delevaryNome) {
		this.delevaryNome = delevaryNome;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public double getpPrix() {
		return pPrix;
	}
	public void setpPrix(double pPrix) {
		this.pPrix = pPrix;
	}
	public double getsPrix() {
		return sPrix;
	}
	public void setsPrix(double sPrix) {
		this.sPrix = sPrix;
	}
	public double gettPrix() {
		return tPrix;
	}
	public void settPrix(double tPrix) {
		this.tPrix = tPrix;
	}
	
}
