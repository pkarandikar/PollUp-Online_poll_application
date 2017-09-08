window.fbAsyncInit = function() {
        FB.init({
          appId      : '441576036016967',
          xfbml      : true,
          version    : 'v2.3'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));// JavaScript Document
	   
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$('.pdd').hover(function(){
	$('#dd').stop().slideDown(200);
},function(){
	$('#dd').stop().slideUp(200);
});
$('.categories').hover(function(){
	$('#cdd').stop().slideDown(200);
},function(){
	$('#cdd').stop().slideUp(200);
});
cnt=2;
$("#addb").click(function () {
 	cnt++;
	if(cnt>5){
            alert("Only 5 answers allowed");
            return false;
	}   
	var newTextBox = $(document.createElement('input')).attr("type","text").attr("class","aans").attr("name",'aans'+cnt).attr("placeholder",'Answer '+cnt).attr("id",'aans'+cnt).attr("required","required");
	var br2 = $(document.createElement('br')).attr("id","br"+cnt);
	newTextBox.appendTo("#anss");
	br2.appendTo("#anss");
	$("#no").val(cnt);
     });
	 
$("#remb").click(function () {
	if(cnt==2){
          alert("You have to insert atleast 2 answers");
          return false;
       }   
        $("#aans"+cnt).remove();
		$("#br"+cnt).remove();
		cnt--;
		$("#no").val(cnt);
 
     });
	 	
$("#cpass").click(function(){
	$('#genset').css('display','none');
	$('#gen').css('background-color','#09c');
	$('#passet').css('display','block');
	$('#cpass').css('background-color','#f79120');
	});
	
$("#gen").click(function(){
	$('#genset').css('display','block');
	$('#gen').css('background-color','#f79120');	
	$('#passet').css('display','none');
	$('#cpass').css('background-color','#09c');
	});
	
var queryValues = {};

$.each(window.location.href.split('?').pop().split('&'), function (i, v)
{
    var v = v.split('=');
    if(v.length > 1) 
      queryValues[ v[0].toLowerCase() ] = v[1].toLowerCase();
});

if ( queryValues.err == 't' || queryValues.err == 'k')
{
	$('#genset').css('display','none');
	$('#gen').css('background-color','#09c');
	$('#passet').css('display','block');
	$('#cpass').css('background-color','#f79120');
}
if ( queryValues.err == 's')
{
	$('#genset').css('display','block');
	$('#gen').css('background-color','#f79120');	
	$('#passet').css('display','none');
	$('#cpass').css('background-color','#09c');
}
