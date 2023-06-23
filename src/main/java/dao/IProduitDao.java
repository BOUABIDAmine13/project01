package dao;

import java.util.List;

import metier.entities.Produit;

public interface IProduitDao {
	public Produit save(Produit p);
	public List<Produit> produitParMotcle(String motcle);
	public List<Produit> produitParCategorie(String categorie);
	public Produit getProduit(Long id);
	public Produit updateProduit(Produit p);
	public void deletProduit(Long id);
	public Produit setImg(Produit p);
	public void setBay(Produit p, int nbQ);
	public double getPrix(Long id);
}
