package web;

import java.util.List;

import metier.entities.Command;
import metier.entities.Produit;
import metier.entities.User;

public class CommandModel {
	User user;
	Produit produit;
	Command command;
	List<Command> listCommand;
	public List<Command> getListCommand() {
		return listCommand;
	}
	public void setListCommand(List<Command> listCommand) {
		this.listCommand = listCommand;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Produit getProduit() {
		return produit;
	}
	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	public Command getCommand() {
		return command;
	}
	public void setCommand(Command command) {
		this.command = command;
	}
}
