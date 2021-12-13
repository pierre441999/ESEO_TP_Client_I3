<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Distance</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<h1>Distance entre deux villes :</h1>
	<br />

	<form method="post">
		<div class="row g-2">
			<div class="col-md">
				<div class="form-floating">
					<select class="form-select" name="ville1" id="ville1">

						<c:forEach var="ville" items="${villes}">
							<c:choose>
								<c:when test="${ status.first }">
									<option
										value="${ville.coord.latitude};${ville.coord.longitude};${ville.nomCommune}"><c:out
											value="${ville.nomCommune}" /></option>
								</c:when>
								<c:when test="${ ville.nomCommune==selection1 }">
									<option
										value="${ville.coord.latitude};${ville.coord.longitude};${ville.nomCommune}"><c:out
											value="${ville.nomCommune}" /></option>
								</c:when>
								<c:otherwise>
									<option
										value="${ville.coord.latitude};${ville.coord.longitude};${ville.nomCommune}"><c:out
											value="${ville.nomCommune}" /></option>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</select> <label for="floatingSelectGrid">Sélectionner ville 1</label>
				</div>
			</div>


			<div class="col-md">
				<div class="form-floating">
					<select class="form-select" name="ville2" id="ville2">

						<c:forEach var="ville" items="${villes}">
							<c:choose>
								<c:when test="${ status.first }">
									<option
										value="${ville.coord.latitude};${ville.coord.longitude};${ville.nomCommune}"><c:out
											value="${ville.nomCommune}" /></option>
								</c:when>
								<c:when test="${ ville.nomCommune==selection1 }">
									<option
										value="${ville.coord.latitude};${ville.coord.longitude};${ville.nomCommune}"><c:out
											value="${ville.nomCommune}" /></option>
								</c:when>
								<c:otherwise>
									<option
										value="${ville.coord.latitude};${ville.coord.longitude};${ville.nomCommune}"><c:out
											value="${ville.nomCommune}" /></option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select> <label for="floatingSelectGrid">Sélectionner ville 2</label>
				</div>
			</div>
		</div>

		
		<div class="alert alert-light" role="alert">
			<input type="submit" class="btn btn-primary mx-auto d-block" value="Distance"
				class='submit' /><br />
		
			<c:out value="${distance}" />
		</div>


	</form>


</body>
</html>