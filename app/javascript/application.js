// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"


document.getElementById("email-switch")
        .addEventListener("click", function(event) {
        	event.preventDefault();
  let emailList = document.getElementsByClassName('form-email');
  if(emailList[0].style.display == "block"){
  	emailList[0].style.display = "none";
  }
  else{
  	emailList[0].style.display = "block";
  }
},false);

document.getElementById("password-switch")
        .addEventListener("click", function(event) {
        event.preventDefault();
  let passList = document.getElementsByClassName('form-password');
  if(passList[0].style.display == "block"){
  	passList[0].style.display = "none";
  	passList[1].style.display = "none";
  }
  else{
  	passList[0].style.display = "block";
  	passList[1].style.display = "block";
  }

},false);