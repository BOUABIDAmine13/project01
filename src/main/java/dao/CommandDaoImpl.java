package dao;

import java.net.CookieManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import metier.entities.Command;
import metier.entities.Produit;
import metier.entities.User;

public class CommandDaoImpl implements ICommandDao{

	@Override
	public List<Produit> addProduitToList(Produit p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Command commandConfirm(Command command) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("INSERT INTO commande (id_client, id_produits, quantite, date_commande, adress,paymentType,pPrix,sPrix,tPrix,id_shipping) VALUE (? ,? ,?, ?, ?,?,?,?,?,?)");
			ps.setLong(1, command.getId_client());
			ps.setLong(2, command.getId_produits());
			ps.setInt(3, command.getQuantite());
			ps.setDate(4, java.sql.Date.valueOf(command.getDate()));
			ps.setString(5, command.getAdress());
			ps.setString(6, command.getPaymentType());
			ps.setDouble(7, command.getpPrix());
			ps.setDouble(8, command.getsPrix());
			ps.setDouble(9, command.gettPrix());
			ps.setLong(10, command.getId_shipping());
			ps.executeUpdate();
			PreparedStatement ps2 = connection.prepareStatement("SELECT MAX(id_commande) as MAXID FROM commande");
			ResultSet rs = ps2.executeQuery();
			if(rs.next()) {
				command.setId_command(rs.getLong("MAXID"));
			}
			ps.close();
			ps2.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return command;
	}

	@Override
	public void commandDelete(User user) {
		// TODO Auto-generated method stub
		
	}

}
