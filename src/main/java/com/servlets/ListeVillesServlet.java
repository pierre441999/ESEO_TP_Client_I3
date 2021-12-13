package com.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.beans.Ville;
import com.google.gson.Gson;

/**
 * Servlet implementation class VilleController
 */
@WebServlet("/ListeVillesController")
public class ListeVillesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListeVillesServlet() {
		super();
	}

	private static String readAll(Reader reader) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = reader.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	public static JSONArray readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONArray jarray = new JSONArray(jsonText);
			return jarray;
		} finally {
			is.close();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("page") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/erreur.jsp").forward(request, response);
		}
		int nbPage = Integer.parseInt(request.getParameter("page"));
		JSONArray jsonArray = null;
		JSONObject json = null;
		List<Ville> villes = new ArrayList<Ville>();
		try {
			jsonArray = readJsonFromUrl("http://localhost:8182/ville");
		} catch (IOException | JSONException e) {
			e.printStackTrace();
		}
		for (int i = 0; i < jsonArray.length(); i++) {
			json = jsonArray.getJSONObject(i);
			Ville ville = new Gson().fromJson(json.toString(), Ville.class);
			villes.add(ville);
		}
		request.setAttribute("villes", villes);
		if (nbPage < 1 || nbPage > villes.size() / 50 + 1) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/erreur.jsp").forward(request, response);
		} else {
			boolean resultat;
		if (nbPage == (villes.size() / 50 + 1)) {
				resultat = true;
		} else {
				resultat = false;
			}
			request.setAttribute("bool", resultat);
			request.setAttribute("nbPage", nbPage);
			request.setAttribute("taille", (nbPage - 1) * 50);

		this.getServletContext().getRequestDispatcher("/WEB-INF/listeVilles.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}