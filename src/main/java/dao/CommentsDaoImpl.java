package dao;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import metier.entities.Comment;
import metier.entities.User;

public class CommentsDaoImpl implements ICommentsDao{

	@Override
	public Comment addComment(Comment comment) {
		Connection connection = SingletonConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("INSERT INTO commonts (contant, dateComm, id_uComm, id_pComm) VALUE (?,?,?,?)");
			ps.setString(1, comment.getCommant());
			ps.setDate(2, java.sql.Date.valueOf(comment.getDate()));
			ps.setLong(3, comment.getUser().getId_user());
			ps.setLong(4, comment.getId_produit());
			ps.executeUpdate();
			PreparedStatement ps2 = connection.prepareStatement("SELECT MAX(id_comm) AS MAXID FROM commonts");
			ResultSet rs = ps2.executeQuery();
			if(rs.next()) {
				comment.setId_commant(rs.getLong("MAXID"));
			}
			ps.close();
			ps2.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comment;
	}

	@Override
	public List<Comment> getComment(Long id_produit) {
		Connection connection = SingletonConnection.getConnection();
		List<Comment> listComment = new ArrayList<Comment>();
			try {
			PreparedStatement ps = connection.prepareStatement("SELECT id_comm,contant, dateComm, id_pComm, id_user ,nom,urlimg FROM commonts, user WHERE id_uComm = id_user AND id_pComm = ?");
			ps.setLong(1, id_produit);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setId_commant(rs.getLong("id_comm"));
				comment.setUser(new User(rs.getLong("id_user"),rs.getString("nom"),rs.getString("urlimg")));
				comment.setId_produit(rs.getLong("id_pComm"));
				comment.setCommant(rs.getString("contant"));
				//Date date = rs.getDate("dateComm");
				//LocalDate date2 = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
				comment.setDate(java.time.LocalDate.parse(rs.getDate("dateComm").toString()));
				listComment.add(comment);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listComment;
	}

	@Override
	public List<User> getCommnetUsers(Long id_produit) {
		/*
		 * Connection connection = SingletonConnection.getConnection(); List<User>
		 * listUser = new ArrayList<User>(); try { PreparedStatement ps = connection.
		 * prepareStatement("SELECT contant, dateComm, id_pComm, id_user ,nom,urlimg FROM commonts, user WHERE id_uComm = id_user AND id_pComm = ?"
		 * ); ps.setLong(1, id_produit); ResultSet rs = ps.executeQuery();
		 * while(rs.next()) { listUser.add(new
		 * User(rs.getString("nom"),rs.getString("urlimg"))); } } catch (SQLException e)
		 * { // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		return null;
	}

}
