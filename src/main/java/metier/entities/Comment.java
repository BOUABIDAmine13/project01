package metier.entities;

import java.time.LocalDate;

public class Comment {
	private Long id_commant;
	private User user;
	private Long id_produit;
	private String commant;
	private LocalDate date;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Comment(User user, Long id_produit, String commant, LocalDate date) {
		super();
		this.user = user;
		this.id_produit = id_produit;
		this.commant = commant;
		this.date = date;
	}

	public Long getId_commant() {
		return id_commant;
	}
	public void setId_commant(Long id_commant) {
		this.id_commant = id_commant;
	}
	public String getCommant() {
		return commant;
	}
	public void setCommant(String commant) {
		this.commant = commant;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Long getId_produit() {
		return id_produit;
	}

	public void setId_produit(Long id_produit) {
		this.id_produit = id_produit;
	}
	
}
