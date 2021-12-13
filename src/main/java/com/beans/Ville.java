package com.beans;

public class Ville {

	private String codeCommune;
	private String nomCommune;
	private String codePostale;
	private String libelle;
	private String ligne_5;
	private Coordonnees coord;

	public Ville() {
	}

	public Ville(String codeCommune, String nomCommune, String codePostale, String libelle, String ligne_5, Coordonnees coord) {
		this.codeCommune = codeCommune;
		this.nomCommune = nomCommune;
		this.codePostale = codePostale;
		this.libelle = libelle;
		this.ligne_5 = ligne_5;
		this.coord = coord;
	}

	public String getCodeCommune() {
		return codeCommune;
	}

	public void setCodeCommune(String codeCommune) {
		this.codeCommune = codeCommune;
	}

	public String getNomCommune() {
		return nomCommune;
	}

	public void setNomCommune(String nomCommune) {
		this.nomCommune = nomCommune;
	}

	public String getCodePostale() {
		return codePostale;
	}

	public void setCodePostale(String codePostale) {
		this.codePostale = codePostale;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public String getLigne_5() {
		return ligne_5;
	}

	public void setLigne_5(String ligne_5) {
		this.ligne_5 = ligne_5;
	}

	public Coordonnees getCoord() {
		return coord;
	}

	public void setCoord(Coordonnees coord) {
		this.coord = coord;
	}
	
	public double distanceWith(Ville ville) {
		// On utilise la méthode de haversine
		double latA = Double.parseDouble(this.getCoord().getLatitude())*Math.PI/180;
		double longA = Double.parseDouble(this.getCoord().getLongitude())*Math.PI/180;
		double latB = Double.parseDouble(ville.getCoord().getLatitude())*Math.PI/180;
		double longB = Double.parseDouble(ville.getCoord().getLongitude())*Math.PI/180;
		double a = Math.pow(Math.sin((latB-latA)/2), 2) + Math.cos(latA)*Math.cos(latB)*Math.pow(Math.sin((longB-longA)/2), 2);
		double c = 2*Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		double d = 6371*c;
		return (double) Math.round(d * 100) / 100; // arrondi deux chiffres après la virgule
	}

}