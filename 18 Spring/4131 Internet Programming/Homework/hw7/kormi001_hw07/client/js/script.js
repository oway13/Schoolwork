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
            tableBuilder(faveplaces);
        }
    }

    // Use the response returned to dynamically add rows to 'myFavTable' present in favourites.html page
    function tableBuilder(response) {
        console.log('tableBuilder');
        var output = "";
        for (var i in response) {
            output += "<tr><td>" +
                response[i].place_name +
                "</td><td>" +
                response[i].addr_line1 +
                " " +
                response[i].addr_line2 +
                "</td><td>" +
                response[i].open_time + " - " +
                response[i].close_time +
                "</td><td>" +
                response[i].add_info +
                "</td><td>" +
                response[i].add_info_url +
                "</td></tr>";
        }
        document.getElementsByTagName("tbody")[0].innerHTML = output;
    }
})();