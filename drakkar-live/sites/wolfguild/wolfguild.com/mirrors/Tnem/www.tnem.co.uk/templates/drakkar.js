function addElement(parentid) {
	var parentobj = document.getElementById(parentid);
	var numobj = document.getElementById('counter');
	numobj.value = (numobj.value - 1) + 2;
	var id = "div_"+numobj.value+"_div";
	var div = document.createElement('div');
	div.setAttribute('id', id);
	var parentrefobj = document.getElementById(parentid+'ref');
	var content = parentrefobj.innerHTML;
	div.innerHTML = content+"<span class='ajax' onClick='removeElement("+'"'+id+'"'+")>Remove</span>";
	parentobj.appendChild(div);
}

function removeElement(id) {
	var obj = document.getElementById(id);
	var parentobj = obj.parentNode;
	parentobj.removeChild(obj);
}

function removeElementObject(obj) {
	var parentobj = obj.parentNode;
	parentobj.removeChild(obj);
}

function numbersonly(myfield, e){
	var key;
	var keychar;

	if (window.event)
		   key = window.event.keyCode;
	else if (e)
		   key = e.which;
	else
		   return true;
	keychar = String.fromCharCode(key);

	// control keys
	if ((key==null) || (key==0) || (key==8) || (key==9) || (key==13) || (key==27) )
	        return true;
	// numbers
	else if ((("0123456789").indexOf(keychar) > -1))
		return true;
	else
	        return false;
}

function refreshImagePreview(obj) {
	var image = obj.parentNode.childNodes[3];
	var imagename = obj.options[obj.selectedIndex].label;
	image.src = 'templates/images/db/'+imagename;
}

function expand(id, total) {
	total = total - 1;
	for(i=1; i <total; i++) {
		document.getElementById(id+'_'+i).style.display = '';
	}
	document.getElementById(id+"_shrink").style.display = '';
	document.getElementById(id+"_expand").style.display = 'none';
}

function shrink(id, total) {
	for(i=1; i <total; i++) {
		document.getElementById(id+'_'+i).style.display = 'none';
	}
	document.getElementById(id+"_shrink").style.display = 'none';
	document.getElementById(id+"_expand").style.display = '';
}

function donothing() {}

function ajaxConnect() {
	var xmlHttp;
	try {
		xmlHttp=new XMLHttpRequest();
	}
	catch (e){
		try{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e){
			try{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e){
				alert("Your browser does not support AJAX!");
				return false;
			}
		}
	}
	return xmlHttp;
}

function deleteAbilityfromItem(item_id, ability_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=deleteAbilityfromItem&item_id="+item_id+"&ability_id="+ability_id,true);
	ajaxconnection.send(null);
}

function deletePlacefromItem(item_id, place_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=deletePlacefromItem&item_id="+item_id+"&place_id="+place_id,true);
	ajaxconnection.send(null);
}

function deletePlacefromMonster(monster_id, place_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=deletePlacefromMonster&monster_id="+monster_id+"&place_id="+place_id,true);
	ajaxconnection.send(null);
}

function deleteMonsterfromItem(item_id, monster_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=deleteMonsterfromItem&item_id="+item_id+"&monster_id="+monster_id,true);
	ajaxconnection.send(null);
}

function addAbilitytoItem(item_id, ability_id, amount) {
	var ajaxconnection = ajaxConnect();
	if(amount == "")
		amount = 0;
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=addAbilitytoItem&item_id="+item_id+"&ability_id="+ability_id+"&amount="+amount,true);
	ajaxconnection.send(null);
}

function addPlacetoItem(item_id, place_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=addPlacetoItem&item_id="+item_id+"&place_id="+place_id,true);
	ajaxconnection.send(null);
}

function addPlacetoMonster(monster_id, place_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=addPlacetoMonster&monster_id="+monster_id+"&place_id="+place_id,true);
	ajaxconnection.send(null);
}

function addImagetoMonster(monster_id, image_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=addImagetoMonster&monster_id="+monster_id+"&image_id="+image_id,true);
	ajaxconnection.send(null);
}

function addMonstertoItem(item_id, monster_id) {
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			location.reload();
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=addMonstertoItem&item_id="+item_id+"&monster_id="+monster_id,true);
	ajaxconnection.send(null);
}

function updateRelatedfromText(textbox, relatedbox) {
	var text = textbox.value;
	var texts = text.split(" ");
	text = texts[texts.length-1];
	var relatedsearch = document.getElementById('relatedsearch');
	relatedsearch.value = text;
	if(text != "") {
	var related;
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			related = eval( "(" + ajaxconnection.responseText + ")" ).items;
			relatedbox.options.length = 0;
			for(var i in related) {
				var option = new Option(related[i].name, "{"+related[i].type+" id="+related[i].id+"}"+related[i].name+"{/"+related[i].type+"}");
				try {
					relatedbox.add(option, null);	
				}catch(ex){
					relatedbox.add(option);
				}
			}
			relatedbox.options[0] = null;
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=findRelated&text="+text,true);
	ajaxconnection.send(null);
	}
}

function updateRelatedfromSearch(text, relatedbox) {
	if(text != "") {
	var related;
	var ajaxconnection = ajaxConnect();
	ajaxconnection.onreadystatechange=function(){
		if(ajaxconnection.readyState==4){
			related = eval( "(" + ajaxconnection.responseText + ")" ).items;
			relatedbox.options.length = 0;
			for(var i in related) {
				var option = new Option(related[i].name, "{"+related[i].type+" id="+related[i].id+"}"+related[i].name+"{/"+related[i].type+"}");
				try {
					relatedbox.add(option, null);	
				}catch(ex){
					relatedbox.add(option);
				}
			}
			relatedbox.options[0] = null;
		}
	}
	ajaxconnection.open("GET","ajax_scripts.php?command=findRelated&text="+text,true);
	ajaxconnection.send(null);
	}
}

function updateRelatedText(text, relatedbox) {
	var boxtext = relatedbox.value;
	var texts = boxtext.split(" ");
	texts[texts.length-1] = text + " ";
	relatedbox.value = texts.join(" ");
	var relatedselect = document.getElementById('relatedselect');
	relatedselect.options.length=0;
	relatedbox.focus();
	var relatedsearch = document.getElementById('relatedsearch');
	relatedsearch.value = '';
}
