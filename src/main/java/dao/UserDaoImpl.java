package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import metier.entities.Produit;
import metier.entities.User;

public class UserDaoImpl implements IUserDao{

	@Override
	public User signup(User u) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("INSERT INTO USER (nom,email,motpass, uType) VALUE(?,?,?, ?)");
			ps.setString(1, u.getNom());
			ps.setString(2,u.getEmail());
			ps.setString(3, u.getMotpass());
			ps.setString(4, "client");
			ps.executeUpdate();
			PreparedStatement ps2 = connection.prepareStatement("SELECT MAX(id_user) as MAXID FROM USER");
			ResultSet rs = ps2.executeQuery();
			if(rs.next()) {
				u.setId_user(rs.getLong("MAXID"));
			}
			ps.close();
			ps2.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public boolean getUserEmail(String eamil) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM USER WHERE email LIKE ?");
			ps.setString(1, eamil);
			ResultSet rs =  ps.executeQuery();
			if(rs.next()) return true;
			else return false;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean getUserPassword(String email,String password) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM USER WHERE email LIKE ?");
			ps.setString(1, email);
			ResultSet rs =  ps.executeQuery();
			if(rs.next()) {
				String passwordDB = rs.getString("motpass");
				if(password.equals(passwordDB)) return true;
			}
			else return false;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User login(String email) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM USER WHERE email LIKE ?");
			ps.setString(1, email);
			ResultSet rs =  ps.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setId_user(rs.getLong("id_user"));
				user.setNom(rs.getString("nom"));
				user.setEmail(rs.getString("email"));
				//user.setMotpass(rs.getString("motpass"));
				user.setUrlImg(rs.getString("urlimg"));
				user.setuType(rs.getString("uType"));
				return user;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User addAvatar(User user) {
		//String urlImg = user.getUrlImg();
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("UPDATE user SET urlimg = ? WHERE id_user = ?");
			ps.setString(1, user.getUrlImg());
			ps.setLong(2, user.getId_user());
			ps.executeUpdate();
			System.out.println("secsse");
			ps.close();

		}catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Produit> getListProduit(User u) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(Long id) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM USER WHERE id_user LIKE ?");
			ps.setLong(1, id);
			ResultSet rs =  ps.executeQuery();
			System.out.println("1111");
			if(rs.next()) {
				User user = new User();
				user.setId_user(rs.getLong("id_user"));
				user.setNom(rs.getString("nom"));
				user.setEmail(rs.getString("email"));
				user.setMotpass(rs.getString("motpass"));
				user.setuType(rs.getString("uType"));
				System.out.println("in data base "+user.getId_user());
				return user;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("2222");
		return null;
	}

	@Override
	public List<User> getUsersList() {
		Connection connection = SingletonConnection.getConnection();
		PreparedStatement ps;
		List<User> listUsers = new ArrayList<User>();
		try {
			ps = connection.prepareStatement("SELECT * FROM user");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User u =new User();
				u.setId_user(rs.getLong("id_user"));
				u.setNom(rs.getString("nom"));
				u.setEmail(rs.getString("email"));
				u.setuType(rs.getString("uType"));
				u.setUrlImg(rs.getString("urlimg"));
				listUsers.add(u);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listUsers;
	}
}
