//EVENTO DE LA SEMANA
$.getJSON( "https://workshops.birs.ca/events/location/CMO.json", function(data){
   var i=0;
   var d=new Date();
   for ( i ;i<=data.length; i++) {
      x1 = (data[i].code);
      x3 = new Date(data[i].start_date);
      x4 = new Date(data[i].end_date);
      x6 = year(x3);
      if (x6 == "2016") {
         if (x3 <= d && x4 >= d) {
            send(x1);
         }
      }
   }
});
//EVENTOS PASADOS Y FUTUROS
$.getJSON( "https://workshops.birs.ca/events/location/CMO.json", function(data){
	var i=0;
   var d=new Date();
	var x = document.getElementById("last");
   var y = document.getElementById("upcoming");
	for ( i ;i<=data.length; i++) {
		x1 = (data[i].code);
		x2 = (data[i].name);
		x3 = (data[i].start_date);
		x4 = (data[i].end_date);
      x5= new Date(x3);
      x6 = year(x3);
      if (x6 == "2016") {
         if (x5 < d && i >= 25 && i <= 28) {
         x.innerHTML +="<div class='col-md-12'><div class='col-md-3'><img class='img-thumbnail' src='http://www.birs.ca/cmo-workshops/2016/"+x1+"/groupphoto.thumb.jpg'/></div> <div class='col-md-9 ' ><b>Workshop</b>: <a href='https://www.birs.ca/events/2016/5-day-workshops/"+x1+"'>"+x2+"</a><p></p>"+x3+" - "+x4+" &#183; 2016 </br> </div></div>";  
      }else if(i > 29  && i <= 33){
        y.innerHTML +="<b>Workshop</b>: <a href='https://www.birs.ca/events/2016/5-day-workshops/"+x1+"'>"+x2+"</a><p></p>"+x3+" - "+x4+", 2016 </br>";
      }
      }else if ( x6 =="2015") {

      }else {

      }
	}
});
//WORKSHOPS POR AÑO
$.getJSON( "https://workshops.birs.ca/events/location/CMO.json", function(data){
   var i=0;
   var y = document.getElementById("2016");
   var y1 = document.getElementById("2015");
   var y2 = document.getElementById("2017");
   for ( i ;i<=data.length; i++) {
      x1 = (data[i].code);
      x2 = (data[i].name);
      x3 = (data[i].start_date);
      x4 = (data[i].end_date);
      x6 = year(x3);
      if (x6 == "2016") {
         y.innerHTML +="<tr class='fila'> <td>" + x1 + "</td><td><a href='https://www.birs.ca/events/2016/5-day-workshops/"+x1+"'>" + x2 + "</a></td><td>" + x3 + "</td><td>" + x4 + "</td></tr>";
      }else if ( x6 =="2015") {
         y1.innerHTML +="<tr class='fila'> <td>" + x1 + "</td><td><a href='https://www.birs.ca/events/2016/5-day-workshops/"+x1+"'>" + x2 + "</a></td><td>" + x3 + "</td><td>" + x4 + "</td></tr>";
      }else {
         y2.innerHTML +="<tr class='fila'> <td>" + x1 + "</td><td><a href='https://www.birs.ca/events/2016/5-day-workshops/"+x1+"'>" + x2 + "</a></td><td>" + x3 + "</td><td>" + x4 + "</td></tr>";
      }
   }
});
//FUNCIONES
function today(date) {
   var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];
   date= new Date(date);
      var dia=date.getUTCDate();
      var mes=months[date.getMonth()];
      return mes+" "+dia;
}
function send (argument) {
   $.getJSON( "https://workshops.birs.ca/events/"+argument+".json", function( data ) {
      var x = document.getElementById("info");
      var start = today(data.start_date);
      var end = today(data.end_date);
      var d = new Date();
      d = today(d);
      x.innerHTML ="<b>Workshop at CMO</b>: <a href='https://www.birs.ca/events/2016/5-day-workshops/"+data.code+"'>"+data.name+"</a><p></p><a href='http://www.birs.ca/events/2016/5-day-workshops/"+data.code+"/press'>Press Release </a>"+start+" - "+end+" &#183; <a href='http://www.birs.ca/events/2016/5-day-workshops/"+data.code+"'>"+data.code+"</a>";
      var f = document.getElementById("thumb");
      f.innerHTML ="<img class='img-thumbnail' src='http://www.birs.ca/cmo-workshops/2016/"+data.code+"/groupphoto.thumb.jpg'/>";
});
}
function year(argument){
   argument= new Date(argument);
   var yea = argument.getFullYear();
   return yea;
}