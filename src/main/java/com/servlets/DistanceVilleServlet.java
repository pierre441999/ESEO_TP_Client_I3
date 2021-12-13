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

import com.beans.Coordonnees;
import com.beans.Ville;
import com.google.gson.Gson;

/**
 * Servlet implementation class VilleController
 */
@WebServlet("/VilleController")
public class DistanceVilleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DistanceVilleServlet() {
		super();
	}

	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
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
		this.getServletContext().getRequestDispatcher("/WEB-INF/distance.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Ville ville1 = new Ville();
		ville1.setCoord(new Coordonnees(request.getParameter("ville1").split(";")[0],
				request.getParameter("ville1").split(";")[1]));
		ville1.setNomCommune(request.getParameter("ville1").split(";")[2]);
		Ville ville2 = new Ville();
		ville2.setCoord(new Coordonnees(request.getParameter("ville2").split(";")[0],
				request.getParameter("ville2").split(";")[1]));
		ville2.setNomCommune(request.getParameter("ville2").split(";")[2]);
		String distance = "La distance entre " + ville1.getNomCommune() + " et " + ville2.getNomCommune() + " est de "
				+ ville1.distanceWith(ville2) + " km.";
		request.setAttribute("distance", distance);
		request.setAttribute("selection1", ville1.getNomCommune());
		request.setAttribute("selection2", ville2.getNomCommune());
		doGet(request, response);
	}

}