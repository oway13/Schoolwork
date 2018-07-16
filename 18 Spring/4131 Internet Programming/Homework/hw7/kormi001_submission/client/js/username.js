"use strict";

(function() {
    // the API end point
    var url = "getUserName";
    var xmlhttp = new XMLHttpRequest();
    // USE AJAX TO CALL getListOfFavPlaces end-point from server
    // Hit the getListOfFavPlaces end-point of server using AJAX get method
    xmlhttp.open("GET", url, true);
    xmlhttp.send();

    // Upon successful completion of API call, server will return the list of places
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var name = JSON.parse(xmlhttp.responseText);
            document.getElementById("navbar").innerHTML +=
              "<li>"+
              "<a><b>"+name[0].acc_name + " | " + name[0].acc_login+"</b></a>" +
              "</li>";
        }
    }

})();