package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.entities.Produit;

public class ProduitDaoImpl implements IProduitDao{

	@Override
	public Produit save(Produit p) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("INSERT INTO produit (designation,prix,quantite_stock,quantite_achte,categorie) values(?,?,?,?,?)");
			ps.setString(1, p.getDesignation());
			ps.setDouble(2, p.getPrix());
			ps.setInt(3, p.getQuantite_stock());
			ps.setInt(4, p.getQuantite_achte());
			ps.setString(5, p.getCategorie());
			//ps.setString(6, p.getUrlImg());
			ps.executeUpdate();
			ps.close();
			PreparedStatement ps2 = connection.prepareStatement("SELECT MAX(id_produit) as MAXID FROM produit");
			ResultSet rs = ps2.executeQuery();
			if(rs.next()) {
				p.setId_produit(rs.getLong("MAXID"));
				//System.out.println("inside 1"+rs.getLong("MAXID"));
			}
			ps2.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("inside 2"+p.getId_produit());
		return p;
	}

	@Override
	public List<Produit> produitParMotcle(String motcle) {
		Connection connection = SingletonConnection.getConnection();
		List<Produit> list = new ArrayList<Produit>();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM produit WHERE designation LIKE ?");
			ps.setString(1, motcle);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Produit p = new Produit();
				p.setId_produit(rs.getLong("id_produit"));
				p.setDesignation(rs.getString("designation"));
				p.setPrix(rs.getDouble("prix"));
				p.setQuantite_achte(rs.getInt("quantite_achte"));
				p.setQuantite_stock(rs.getInt("quantite_stock"));
				p.setCategorie(rs.getString("categorie"));
				p.setUrlImg(rs.getString("urlimg"));
				list.add(p);
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Produit> produitParCategorie(String categorie) {
		Connection connection = SingletonConnection.getConnection();
		List<Produit> list = new ArrayList<Produit>();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM produit WHERE categorie LIKE ?");
			ps.setString(1, categorie);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Produit p = new Produit();
				p.setId_produit(rs.getLong("id_produit"));
				p.setDesignation(rs.getString("designation"));
				p.setPrix(rs.getDouble("prix"));
				p.setQuantite_achte(rs.getInt("quantite_achte"));
				p.setQuantite_stock(rs.getInt("quantite_stock"));
				p.setCategorie(rs.getString("categorie"));
				p.setUrlImg(rs.getString("urlimg"));
				list.add(p);
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Produit getProduit(Long id) {
		System.out.println("in 0");
		Connection connection = SingletonConnection.getConnection();
		Produit p = new Produit();
		System.out.println("in 00");
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM produit WHERE id_produit = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println("in 1");
				p.setId_produit(rs.getLong("id_produit"));
				p.setDesignation(rs.getString("designation"));
				p.setPrix(rs.getDouble("prix"));
				p.setQuantite_achte(rs.getInt("quantite_achte"));
				p.setQuantite_stock(rs.getInt("quantite_stock"));
				p.setCategorie(rs.getString("categorie"));
				p.setUrlImg(rs.getString("urlimg"));
				System.out.println("in 2");
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public Produit updateProduit(Produit p) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("UPDATE produit SET designation = ?,prix = ?,quantite_stock = ?,quantite_achte = ?,categorie = ?,urlimg = ? WHERE id_produit = ?");
			ps.setString(1, p.getDesignation());
			ps.setDouble(2, p.getPrix());
			ps.setInt(3, p.getQuantite_stock());
			ps.setInt(4, p.getQuantite_achte());
			ps.setString(5, p.getCategorie());
			ps.setString(6, p.getUrlImg());
			ps.setLong(7, p.getId_produit());
			ps.executeUpdate();
			ps.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public void deletProduit(Long id) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("DELETE FROM produit WHERE id_produit = ?");
			ps.setLong(1, id);
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Produit setImg(Produit p) {
		Connection connection  = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("UPDATE produit SET urlimg = ? WHERE id_produit = ?");
			ps.setString(1, p.getUrlImg());
			ps.setLong(2, p.getId_produit());
			ps.executeUpdate();
			ps.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void setBay(Produit p, int nbQ) {
		Connection connection = SingletonConnection.getConnection();
		int nbAchat = 0;
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT quantite_achte FROM produit WHERE id_produit = ?");
			ps.setLong(1, p.getId_produit());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				nbAchat = rs.getInt("quantite_achte")+nbQ;
			}
			PreparedStatement ps2 = connection.prepareStatement("UPDATE produit SET quantite_achte = ? WHERE id_produit = ?");
			ps2.setInt(1, nbAchat);
			ps2.setLong(2, p.getId_produit());
			ps2.executeUpdate();
			ps.close();
			ps2.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public double getPrix(Long id) {
		Connection connection = SingletonConnection.getConnection();
		double prix = 0;
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT prix FROM produit WHERE id_produit = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				prix = rs.getDouble("prix");
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prix;
	}

}
