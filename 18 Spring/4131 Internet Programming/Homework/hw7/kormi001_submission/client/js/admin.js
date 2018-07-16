"use strict";

(function() {
    // the API end point
    var url = "getAccountsList";
    var xmlhttp = new XMLHttpRequest();
    // USE AJAX TO CALL getListOfFavPlaces end-point from server
    // Hit the getListOfFavPlaces end-point of server using AJAX get method
    xmlhttp.open("GET", url, true);
    xmlhttp.send();

    // Upon successful completion of API call, server will return the list of places
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var accounts = JSON.parse(xmlhttp.responseText);
            tableBuilder(accounts);
        }
    }

    // Use the response returned to dynamically add rows to 'myFavTable' present in favourites.html page
    function tableBuilder(response) {
        console.log('tableBuilder');
        var output = "";
        for (var i in response) {
            output += "<tr id='"+response[i].acc_name+"Row'><td>" +
                response[i].acc_id +
                "</td><td>" +
                response[i].acc_name +
                "</td><td>" +
                response[i].acc_login +
                "</td><td>" +
                "</td><td>" +
                "<button id='"+response[i].acc_name+"' type='button' onclick='startEditUser()'>E</button>" +
                "<button id='"+response[i].acc_id+"' type='button' onclick='deleteUser()'>D</button>"  +
                "</td></tr>";
        }
        document.getElementById("acc").innerHTML = output;
    }
})();

var newacc = false;
var editacc = false;
var temp = false;

function startNewUser(){
  if (!newacc){
    if(editacc){
      cancelEdit();
    }
    var old = document.getElementById("acc").innerHTML;
    var output = old +
      "<tr id='newuserrow'>" +
      "<td></td><td>" +
      "<input type='text' name='name' required>" +
      "</td><td>" +
      "<input type='text' name='login' required>" +
      "</td><td>" +
      "<input type='text' name='password' required>" + 
      "</td><td>" + 
      "<input type='submit' value='S'>" +
      "<button type='button' onclick='cancelAdd()'>C</button>" +
      "<input name='ftype' type='hidden' value='New'>" +
      "</td></tr>";
    document.getElementById("acc").innerHTML = output;
    newacc = true;
  }
}

function cancelAdd(){
  var todelete = document.getElementById('newuserrow');
  document.getElementById("acc").removeChild(todelete);
  newacc = false;
}

function deleteUser(){
  if (newacc){
    cancelAdd();
  }
  if(editacc){
    cancelEdit();
  }
  console.log("Delete User ID: "+event.target.id);
  var old = document.getElementsByName('addUser')[0].innerHTML;
  var output = old +
  "<input type='hidden' name='id' value='"+event.target.id+"'>" +
  "<input name='ftype' type='hidden' value='Delete'>";
  document.getElementsByName('addUser')[0].innerHTML = output;
  document.getElementsByName('addUser')[0].submit();
  document.getElementsByName('addUser')[0].innerHTML = old;
}

function startEditUser(){
  if(!editacc){
    if (newacc){
      cancelAdd();
    }
    var rowToEdit = document.getElementById(event.target.id+"Row");
    var name = rowToEdit.children[1].innerText;
    var login = rowToEdit.children[2].innerText;
    var id = rowToEdit.children[0].innerText;;
    editacc = event.target.id+"Row";
    temp = rowToEdit.innerHTML;
    var output = 
      "<td>"+id+"</td><td>" +
      "<input type='text' name='name' value='"+name+"' required>" +
      "</td><td>" +
      "<input type='text' name='login' value='"+login+"' required>" +
      "</td><td>" +
      "<input type='text' name='password'>" + 
      "</td><td>" + 
      "<input type='submit' value='S'>" +
      "<button type='button' onclick='cancelEdit()'>C</button>" +
      "<input name='id' type='hidden' value='"+id+"'>" +
      "<input name='ftype' type='hidden' value='Edit'>" +
      "</td>";
    rowToEdit.innerHTML = output;
  }
}

function cancelEdit(){
  document.getElementById(editacc).innerHTML = temp;
  editacc = false;
  temp = false;
}