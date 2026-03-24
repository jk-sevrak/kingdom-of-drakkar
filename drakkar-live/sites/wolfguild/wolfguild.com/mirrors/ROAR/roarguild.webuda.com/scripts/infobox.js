function itemOpen(lunchID) {
document.getElementById('lunch_' + lunchID).style.display = "block";
document.getElementById('clasp_' + lunchID).innerHTML="<a href=\"javascript:itemClose('" + lunchID + "');\"><strong>Hide</strong>" + "</a>";
}
function itemClose(lunchID) {
document.getElementById('lunch_' + lunchID).style.display = "none";
document.getElementById('clasp_' + lunchID).innerHTML="<a href=\"javascript:itemOpen('" + lunchID + "');\"><strong>Show</strong>" + "</a>";
} 
