package dao;

import java.util.List;

import metier.entities.Delevary;

public interface DelevaryDaoImpl {
	public Delevary saveDelevary(Delevary d);
	public void deletDelevary(Delevary d);
	public List<Delevary> getAllDelevarys();
	public double getPrix(Long id);
	public String getDeleveryNAme(Long id);
}
