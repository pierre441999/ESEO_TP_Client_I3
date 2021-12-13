<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<h1>Communes de France :</h1>


	<table class="table">
		<thead>
			<tr>
				<th scope="col">Code commune</th>
				<th scope="col">Nom de la commune</th>
				<th scope="col">Code Postale</th>
				<th scope="col">Libelle acheminement</th>
				<th scope="col">Ligne 5</th>
				<th scope="col">Coordonnees</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ville" items="${villes}" begin="${taille}" end="${taille+49}">
				<tr>
					<td><c:out
							value=" <a href='infosVille?codeCommune=${ville.codeCommune}'> ${ville.codeCommune}"
							escapeXml="false" /></td>
					<td><c:out value="${ville.nomCommune}" /></td>
					<td><c:out value="${ville.codePostale}" /></td>
					<td><c:out value="${ville.libelle}" /></td>
					<td><c:out value="${ville.ligne_5}" /></td>
					<td><c:out value="${ville.coord.latitude}, ${ville.coord.longitude}" /></td>

				</tr>
			</c:forEach>

		</tbody>


	</table>
	
<div class="hstack gap-3">
  <div class="bg-light border">
	<c:if test="${nbPage != 1 }">
		<p>
			<a href="/ESEO_TP_Client_I3/listeVilles?page=${nbPage - 1 }">
			<button type="button" class="btn btn-outline-primary">Page précedente</button></a>
		</p>
	</c:if>
 </div>
   <div class="bg-light border ms-auto">
	<c:if test="${!bool}">
		<p>
			<a href="/ESEO_TP_Client_I3/listeVilles?page=${nbPage + 1 }">
			<button type="button" class="btn btn-outline-primary">Page suivante</button></a>
		</p>
	</c:if>
	</div>
</div>

</body>
</html>