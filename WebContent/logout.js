/*var validNavigation = false;

function wireUpEvents() {
var dont_confirm_leave = 0;
var leave_message = 'Do you want to logout?'
function goodbye(e) {
if (!validNavigation)
window.open("http://localhost:8080/HDMovie/logout","_blank");
}
window.onbeforeunload=goodbye;

$(document).bind('keypress', function(e) {
if (e.keyCode == 116){
  validNavigation = true;
 }
 });

$("a").bind("click", function() {
validNavigation = true;
});

$("form").bind("submit", function() {
 validNavigation = true;
});

$("input[type=submit]").bind("click", function() {
 validNavigation = true;
 });

 }

$(document).ready(function() {
   wireUpEvents();
});*/