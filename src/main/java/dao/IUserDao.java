package dao;

import java.util.List;

import metier.entities.Produit;
import metier.entities.User;

public interface IUserDao {
	public User signup(User u);
	public boolean getUserEmail(String eamil);
	public boolean getUserPassword(String email, String password);
	public User login(String email);
	public User addAvatar(User user);
	public List<Produit> getListProduit(User u);
	public User getUser (Long id); 
	public List<User> getUsersList();
}
