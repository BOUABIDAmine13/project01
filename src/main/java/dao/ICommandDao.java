package dao;

import java.util.List;

import metier.entities.Command;
import metier.entities.Produit;
import metier.entities.User;

public interface ICommandDao {
	public List<Produit> addProduitToList(Produit p);
	public Command commandConfirm(Command command);
	public void commandDelete(User user);
}
