package web;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import dao.CommandDaoImpl;
import dao.CommentsDaoImpl;
import dao.DelevaryDaoImpl;
import dao.ICommandDao;
import dao.ICommentsDao;
import dao.IDlevaryDao;
import dao.IProduitDao;
import dao.IUserDao;
import dao.ProduitDaoImpl;
import dao.UserDaoImpl;
import metier.entities.CipherAlgo;
import metier.entities.Command;
import metier.entities.Comment;
import metier.entities.Delevary;
import metier.entities.Produit;
import metier.entities.User;

/**
 * Servlet implementation class ControleurServlet
 */
@WebServlet(name="sc",urlPatterns = {"*.dz"})
public class ControleurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:\\Users\\DELL\\eclipse-workspace\\projectAppdes\\src\\main\\webapp\\img\\usersAvatar";
	private final String UPLOAD_DIRECTORY2 = "C:\\Users\\DELL\\eclipse-workspace\\projectAppdes\\src\\main\\webapp\\img\\produitsImg";
	private final String UPLOAD_DIRECTORY3 = "img\\produitsImg\\";
	private final String UPLOAD_DIRECTORY4 = "img\\usersAvatar\\";
     private IProduitDao daoProduit;
     private IUserDao daoUser;
     private ICommandDao daoCommand;
     private ICommentsDao daoComment;
     private DelevaryDaoImpl daoDelevary;
	public void init(ServletConfig config) throws ServletException {
		daoProduit = new ProduitDaoImpl();
		daoUser = new UserDaoImpl(); 
		daoCommand = new CommandDaoImpl();
		daoComment = new CommentsDaoImpl();
		daoDelevary = new IDlevaryDao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("/vue/index.jsp");
		if((request.getServletPath()).equals("/index.dz")) {
			//String motCle = request.getParameter("motcle");
			//System.out.println(motCle);
			request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
		}else if(request.getServletPath().equals("/charche.dz")){
			String motCle = request.getParameter("motcle");
			ProduitModel produitModel = new ProduitModel();
			produitModel.setMotcle(motCle);
			produitModel.setListProduit(daoProduit.produitParMotcle("%"+motCle+"%"));
			request.setAttribute("produitModel", produitModel);
			request.setAttribute("motCle", motCle);
			//System.out.println(produitModel.getListProduit().get(0).getId_produit());
			request.getRequestDispatcher("/vue/getProducts.jsp").forward(request, response);
			
		}else if(request.getServletPath().equals("/getProduits.dz")){
			String catogiry = request.getParameter("gatigiry");
			ProduitModel produitModel = new ProduitModel();
			produitModel.setListProduit(daoProduit.produitParCategorie(catogiry));
			request.setAttribute("produitModel", produitModel);
			//System.out.println(produitModel.getListProduit().get(0).getId_produit());
			request.getRequestDispatcher("/vue/getProducts.jsp").forward(request, response);
		}else if(request.getServletPath().equals("/login.dz")){
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			System.out.println("11111");
			if(session.getAttribute("user") != null && user.getuType().equals("admin")) {
				System.out.println("22222");
				request.getRequestDispatcher("/vue/adminPage.jsp").forward(request, response);
			}
			
			if(session.getAttribute("user") != null && user.getuType().equals("client")) {
				System.out.println("33333");
				request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
			}
			/*
			 * Cookie[] cookies = request.getCookies(); if(cookies != null) { for(Cookie
			 * cookie : cookies) { System.out.println(cookie.getName());
			 * if(cookie.getName().equals("JSESSIONID")) { System.out.println("hir1");
			 * request.getRequestDispatcher("/vue/index.jsp").forward(request, response); }
			 * } }
			 */
			request.setAttribute("message", "");
			System.out.println("444444");
			request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
			
		}else if(request.getServletPath().equals("/signup.dz")){
			HttpSession session = request.getSession();
			if(session.getAttribute("user") != null) {
				request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
			}
			request.getRequestDispatcher("/vue/signup.jsp").forward(request, response);
			
		}else if (request.getServletPath().equals("/commandProduit.dz")) {
			ProduitModel produitModel = new ProduitModel();
			CommentModel commentModel = new CommentModel();
			DeleveryModel deleveryModel = new DeleveryModel();
			produitModel.setProduit(daoProduit.getProduit(Long.parseLong(request.getParameter("Idproduit"))));
			commentModel.setListComments(daoComment.getComment(Long.parseLong(request.getParameter("Idproduit"))));
			commentModel.setListClient(daoComment.getCommnetUsers(Long.parseLong(request.getParameter("Idproduit"))));
			deleveryModel.setListDelevary(daoDelevary.getAllDelevarys());
			request.setAttribute("produitModel", produitModel);
			request.setAttribute("commentModel", commentModel);
			request.setAttribute("shippongModel", deleveryModel);
			request.getRequestDispatcher("/vue/commandProduit.jsp").forward(request, response);
			
		}else if (request.getServletPath().equals("/addproduit.dz")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if(session.getAttribute("user") != null && user.getuType().equals("admin")) {
				request.getRequestDispatcher("/vue/addProduit.jsp").forward(request, response);
			}else {
			request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
			}
		}else if (request.getServletPath().equals("/tt.dz")) {
			request.getRequestDispatcher("/vue/addAvatar.jsp").forward(request, response);
			
		}else if (request.getServletPath().equals("/getAllProduct.dz")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if(session.getAttribute("user") != null && user.getuType().equals("admin")) {
				ProduitModel produitModel = new ProduitModel();
				produitModel.setListProduit(daoProduit.produitParMotcle("%%"));
				request.setAttribute("produictModel", produitModel);
				request.getRequestDispatcher("/vue/printProduits.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
			}
		}else if (request.getServletPath().equals("/getAllUser.dz")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if(session.getAttribute("user") != null && user.getuType().equals("admin")) {
				UserModel userModel = new UserModel();
				userModel.setUserList(daoUser.getUsersList());
				request.setAttribute("userModel", userModel);
				request.getRequestDispatcher("/vue/printUsers.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
			}//getAllOrders.dz
		} /*
			 * else if (request.getServletPath().equals("/getAllOrders.dz")) { HttpSession
			 * session = request.getSession(); User user = (User)
			 * session.getAttribute("user"); if(session.getAttribute("user") != null &&
			 * user.getuType().equals("admin")) { CommandModel commandModel = new
			 * CommandModel(); commandModel.setListCommand(daoCommand.)
			 * request.setAttribute("userModel", userModel);
			 * request.getRequestDispatcher("/vue/printUsers.jsp").forward(request,
			 * response); } request.getRequestDispatcher("/vue/index.jsp").forward(request,
			 * response); //getAllOrders.dz }
			 */else if (request.getServletPath().equals("/bayProduct.dz")) {
				HttpSession session = request.getSession();
				if(session.getAttribute("user") != null) {
				Long idShipping = Long.parseLong(request.getParameter("shipping"));
				int quntity = Integer.parseInt(request.getParameter("quntity"));
				Long idProduit = Long.parseLong(request.getParameter("idProduct"));
				//User user = (User)session.getAttribute("user");
				double pPrix = daoProduit.getPrix(idProduit)*quntity;
				double sPrix = daoDelevary.getPrix(idShipping);
				Long idClient = ((User)session.getAttribute("user")).getId_user();
				String adress = request.getParameter("adresss");
				String pymentType = request.getParameter("paymentMethod");
				CommandModel commandModel = new CommandModel();
				//commandModel.setCommand(daoCommand.commandConfirm(new Command(idClient,idProduit, idShipping,quntity,LocalDate.now(),adress,pymentType,pPrix,sPrix)));
				commandModel.setUser(daoUser.getUser(idClient));
				commandModel.setProduit(daoProduit.getProduit(idProduit));
				commandModel.setCommand(new Command(idClient,idProduit, idShipping,quntity,LocalDate.now(),adress,pymentType, pPrix, sPrix));
				commandModel.getCommand().setDelevaryNome(daoDelevary.getDeleveryNAme(idShipping));
				request.setAttribute("commandModel", commandModel);
				request.getRequestDispatcher("/vue/commandConform.jsp").forward(request, response);
			}else {
				request.setAttribute("message", "need to login for bay");
				request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
			}
		}else if (request.getServletPath().equals("/pritnCategories.dz")) {
			System.out.println(request.getParameter("categorie"));
		}else if(request.getServletPath().equals("/logout.dz")) {
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(Cookie cookie : cookies) {
					if(cookie.getName().equals("JSESSIONID")) {
						cookie.setMaxAge(0);
						response.addCookie(cookie);
						break;
					}
				}
			}
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
			}else if(request.getServletPath().equals("/ttt.dz")) {
				request.getRequestDispatcher("/vue/commandConform.jsp").forward(request, response);
			}else if(request.getServletPath().equals("/DeliveryForm.dz")) {
				request.getRequestDispatcher("/vue/delevryForm.jsp").forward(request, response);
			}else if(request.getServletPath().equals("/deleteProduct.dz")) {
				String idProduit = request.getParameter("idProduit");
				daoProduit.deletProduit(Long.parseLong(idProduit));
				ProduitModel produitModel = new ProduitModel();
				produitModel.setListProduit(daoProduit.produitParMotcle("%%"));
				request.setAttribute("produictModel", produitModel);
				request.getRequestDispatcher("/vue/printProduits.jsp").forward(request, response);
				request.getRequestDispatcher("/vue/delevryForm.jsp").forward(request, response);
			}else {
			response.sendError(Response.SC_NOT_FOUND);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getServletPath().equals("/signup.dz")) {
			String nom = request.getParameter("userName");
			String email = request.getParameter("userEmail");
			String password = null;
			try {
				password = CipherAlgo.ecrypt(request.getParameter("userPassword"), CipherAlgo.generateKey());
			} catch (Exception e) {
				e.printStackTrace();
				request.getRequestDispatcher("/vue/signup.jsp").forward(request, response);
			}
			//User user = ;
			UserModel userModel = new UserModel();
			userModel.setUser(daoUser.signup(new User(nom,email,password)));
			request.setAttribute("user", userModel.getUser());
			request.getRequestDispatcher("/vue/addAvatar.jsp").forward(request, response);
			
		}else if(request.getServletPath().equals("/uploadAvatar.dz")) {
			String filedName = null;
			
			if(ServletFileUpload.isMultipartContent(request)) {
				try {
					List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
					for(FileItem item : multiparts) {
						if(item.isFormField()) {
							filedName = item.getString(); 
							System.out.println(filedName);
							System.out.println("hir1");
						}else {
							System.out.println("hir5");
							item.write(new File(UPLOAD_DIRECTORY+File.separator+filedName+"."+FilenameUtils.getExtension(new File(item.getName()).getName())));
							User user = daoUser.getUser(Long.parseLong(filedName));
							user.setUrlImg(UPLOAD_DIRECTORY4+filedName+"."+FilenameUtils.getExtension(new File(item.getName()).getName()));
							daoUser.addAvatar(user);
							System.out.println("hir2");
						}
					}
				}catch(Exception e) {
					request.setAttribute("message", "File upload failed"+e.getMessage());
				}
			} else {
				request.setAttribute("message", "File upload servlet handler");
			}
			request.setAttribute("message", "");
			request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
			
		}else if(request.getServletPath().equals("/login.dz")) {
			String email = request.getParameter("userEmail");
			String password = null;
			try {
				password = CipherAlgo.ecrypt(request.getParameter("userPassword"), CipherAlgo.generateKey());
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(!daoUser.getUserEmail(email)) {
				request.setAttribute("message", "email not exist");
				request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
			}else if(!daoUser.getUserPassword(email,password)) {
				request.setAttribute("message", "worge password");
				request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
			}else {
				HttpSession session = request.getSession();
				User user = daoUser.login(email);
				//session.setAttribute("user", user.getId_user());
				session.setAttribute("user", user);
				//session.setAttribute("userType", user.getuType());
				request.setAttribute("user", user);
				session.setMaxInactiveInterval(30*60);
				Cookie userCookie = new Cookie("user", user.getNom());
				userCookie.setMaxAge(30*60);
				response.addCookie(userCookie);
				if(user.getuType().equals("admin")) {
					List<User> userList = daoUser.getUsersList();
					List<Produit> produitList = daoProduit.produitParMotcle("%%");
					request.setAttribute("userList", userList);
					request.setAttribute("produitList", produitList);
					//System.out.println(produitList.get(0).getDesignation());
					request.getRequestDispatcher("/vue/adminePage.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
				}
			}
			
			//response.sendRedirect("/vue/index.jsp");
			
		} else if(request.getServletPath().equals("/addProduits.dz")) {
			String designation = request.getParameter("designation");
			double prix = Double.parseDouble(request.getParameter("prix"));
			int quantite_stock = Integer.parseInt( request.getParameter("quantite_stock"));
			String categorie = request.getParameter("categorie");
			ProduitModel produitModel = new ProduitModel();
			produitModel.setProduit(daoProduit.save(new Produit(designation,prix,quantite_stock,categorie)));
			request.setAttribute("produit", produitModel.getProduit());
			request.getRequestDispatcher("/vue/addProduitImg.jsp").forward(request, response);
			
		}else if(request.getServletPath().equals("/uploadProduitImg.dz")) {
			String filedName = null;
			if(ServletFileUpload.isMultipartContent(request)) {
				try {
					List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
					for(FileItem item : multiparts) {
						if(item.isFormField()) {
							filedName = item.getString(); 
						}else {
							item.write(new File(UPLOAD_DIRECTORY2+File.separator+filedName+"."+FilenameUtils.getExtension(new File(item.getName()).getName())));
							ProduitModel produitModel = new ProduitModel();
							produitModel.setProduit(daoProduit.getProduit(Long.parseLong(filedName)));
							produitModel.getProduit().setUrlImg(UPLOAD_DIRECTORY3+filedName+"."+FilenameUtils.getExtension(new File(item.getName()).getName()));
							daoProduit.setImg(produitModel.getProduit());
							request.setAttribute("produit",produitModel.getProduit());
							System.out.println("get pro"+produitModel.getProduit().getDesignation());
							request.setAttribute("message", "");
						}
					}
				}catch(Exception e) {
					request.setAttribute("message", "File upload failed"+e.getMessage());
				}
			} else {
				request.setAttribute("message", "File upload servlet handler");
			}
			request.getRequestDispatcher("/vue/confirmation.jsp").forward(request, response);
			
		}else if(request.getServletPath().equals("/saveCommand.dz")) {
			System.out.println("save");
			Long idClient = Long.parseLong(request.getParameter("idClient").toString());
			Long idProduit = Long.parseLong(request.getParameter("idProduit"));
			Long idShipping = Long.parseLong(request.getParameter("idShipping"));
			int quntity = Integer.parseInt(request.getParameter("quantite"));
			String pymentType = request.getParameter("paymentType");
			String adress = request.getParameter("adress");
			double pPrix = daoProduit.getPrix(idProduit)*quntity;
			double sPrix = daoDelevary.getPrix(idShipping);
			daoCommand.commandConfirm(new Command(idClient,idProduit, idShipping,quntity,LocalDate.now(), adress,pymentType,pPrix,sPrix));
			request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
		}else if(request.getServletPath().equals("/addComment.dz")) {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			Long id_produit = Long.parseLong(request.getParameter("idProduit"));
			String content = request.getParameter("commant");
			if(!content.equals("")) {
				daoComment.addComment(new Comment(user, id_produit, content, LocalDate.now()));
			}
			ProduitModel produitModel = new ProduitModel();
			produitModel.setProduit(daoProduit.getProduit(id_produit));
			CommentModel commentModel = new CommentModel();
			commentModel.setListComments(daoComment.getComment(id_produit));
			commentModel.setListClient(daoComment.getCommnetUsers(id_produit));
			request.setAttribute("produitModel", produitModel);
			request.setAttribute("commentModel", commentModel);
			request.getRequestDispatcher("/vue/commandProduit.jsp").forward(request, response);
		}else if(request.getServletPath().equals("/saveDelevry.dz")) {
			  String fName = request.getParameter("fName");
			  String lName =request.getParameter("lName"); 
			  String cName = request.getParameter("cName"); 
			  String email = request.getParameter("email"); 
			  String address = request.getParameter("address");
			  double prix = Double.parseDouble(request.getParameter("prix"));
			  System.out.println("d save 1");
			  daoDelevary.saveDelevary(new Delevary(fName,lName,cName,address,email,prix));
			  request.getRequestDispatcher("/vue/index.jsp").forward(request, response);
		}
	}
}
