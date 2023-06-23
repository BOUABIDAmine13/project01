package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.entities.Delevary;

public class IDlevaryDao implements DelevaryDaoImpl{

	@Override
	public Delevary saveDelevary(Delevary d) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("INSERT INTO deleverys (fName,lName,cName,adress,eamil,prix) VALUE (?,?,?,?,?,?)");
			ps.setString(1, d.getFirtName());
			ps.setString(2, d.getLastName());
			ps.setString(3, d.getCompenyName());
			ps.setString(4, d.getAddress());
			ps.setString(5, d.getEmail());
			ps.setDouble(6, d.getPrix());
			ps.executeUpdate();
			PreparedStatement ps2 = connection.prepareStatement("SELECT MAX(id_delevery) as MAXID FROM deleverys");
			ResultSet rs = ps2.executeQuery();
			if(rs.next()) {
				d.setId_delevery(rs.getLong("MAXID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public void deletDelevary(Delevary d) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("DELETE FROM deleverys WHERE id_delevery = ?");
			ps.setLong(1, d.getId_delevery());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Delevary> getAllDelevarys() {
		List<Delevary> listDelevarys = new ArrayList<Delevary>();
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM deleverys");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Delevary d = new Delevary();
				d.setId_delevery(rs.getLong("id_delevery"));
				d.setFirtName(rs.getString("fName"));
				d.setLastName(rs.getString("lName"));
				d.setCompenyName(rs.getString("cName"));
				d.setAddress(rs.getString("adress"));
				d.setEmail(rs.getString("eamil"));
				d.setPrix(rs.getDouble("prix"));
				listDelevarys.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listDelevarys;
	}

	@Override
	public double getPrix(Long id) {
		Connection connection = SingletonConnection.getConnection();
		double prix = 0;
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT prix FROM deleverys WHERE id_delevery = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				prix=rs.getDouble("prix");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prix;
	}

	@Override
	public String getDeleveryNAme(Long id) {
		Connection connection = SingletonConnection.getConnection();
		String deleveryName = null;
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT cName FROM deleverys WHERE id_delevery = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				deleveryName=rs.getString("cName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return deleveryName;
	}

}
