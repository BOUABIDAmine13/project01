package dao;

import java.util.List;

import metier.entities.Comment;
import metier.entities.User;

public interface ICommentsDao {
	public Comment addComment(Comment comment);
	public List<Comment> getComment(Long id_produit);
	public List<User> getCommnetUsers(Long id_produit);
}
