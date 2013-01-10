var setContent = function(contentHTML)
{
	$("#content_div").empty().append(contentHTML);
//    alert(contentHTML);
};

$(document).ready(function(){
    setContent("aaa");        
});