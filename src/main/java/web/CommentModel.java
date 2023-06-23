package web;

import java.util.List;

import metier.entities.Comment;
import metier.entities.Produit;
import metier.entities.User;

public class CommentModel {
	Comment comment;
	List<Comment> listComments;
	List<User> listClient;
	Produit produit;
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public List<Comment> getListComments() {
		return listComments;
	}
	public void setListComments(List<Comment> listComments) {
		this.listComments = listComments;
	}
	public List<User> getListClient() {
		return listClient;
	}
	public void setListClient(List<User> listClient) {
		this.listClient = listClient;
	}
	public Produit getProduit() {
		return produit;
	}
	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	
}
