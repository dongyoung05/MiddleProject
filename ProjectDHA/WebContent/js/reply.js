

$.replyList = function() {
	$.ajax({
		
		
		url : `${mypath}/replyList.do`,
		data : {"board_no" : board_no},
		dataType : 'json',
		type : 'post',
		success : function(res) {
		code="";
			$.each(res, function(i, v){ 
					rcont = v.reply_content;	// 엔터만 포함 
					rcont = rcont.replaceAll(/\n/g, "<br>");
			
			code +=  `<div class="reply-body">
						<div class="p12">
							<p class="p1">
						        	작성자 : <span class="rwr">${v.reply_writer}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        	날짜 : <span class="rda">${v.reply_date}</span>         
						  	</p>
						   	<p class ="p2">`;
						               
								
			code += `<input idx="${v.reply_no}" type="button"  value="댓글수정" name="remodify"  class="action">
					 <input idx="${v.reply_no}" type="button"  value="댓글삭제" name="redelete"  class="action">`;
							   	
					code +=`</p>
						 </div>
						   	<p class="rp3">
						        ${rcont}
						   	</p>
					</div>`;
			})
		
			$('#replyList').html(code);	
			
		},
		error : function(xhr){
			alert('상태 : ' + xhr.status);
		}
		
	})
}