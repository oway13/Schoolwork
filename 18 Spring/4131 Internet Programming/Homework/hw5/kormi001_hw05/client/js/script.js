"use strict";

(function() {
	// the API end point
	var url = "getListOfFavPlaces";
	var xmlhttp = new XMLHttpRequest();
	// USE AJAX TO CALL getListOfFavPlaces end-point from server
	// Hit the getListOfFavPlaces end-point of server using AJAX get method
	xmlhttp.open("GET", url, true);
	xmlhttp.send();

	// Upon successful completion of API call, server will return the list of places
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var faveplaces = JSON.parse(xmlhttp.responseText);
			tableBuilder(faveplaces.res.placeList);
		}
	}
	
	// Use the response returned to dynamically add rows to 'myFavTable' present in favourites.html page
	function tableBuilder(response) {
		console.log('tableBuilder');
		var output = "";
		for (var i in response) {
		 	output+="<tr><td>"
		 	+ response[i].placename 
		 	+ "</td><td>" 
			+ response[i].addressline1 
			+ " "
		 	+ response[i].addressline2 
		 	+ "</td><td>"
			+ response[i].opentime + " - "
		   	+ response[i].closetime
			+ "</td><td>"
			+ response[i].additionalinfo
			+ "</td><td>"
			+ response[i].additionalinfourl
			+ "</td></tr>";
		}
		document.getElementsByTagName("tbody")[0].innerHTML = output;
	}
})();