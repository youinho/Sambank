/**
 *  모듈화 : 클로저 패턴
 */
let replyService=(function(){
	//외부에서 직접적인 호출 불가
	function add(reply,callback){
		console.log("add method 호출");
		
		$.ajax({
			type:'post',
			url:'/replies/new',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(reply),
			success:function(result){
				if(callback)
					callback(result);
			}
		})		
	} //댓글 삽입 종료
	
	function getList(param,callback){
		// param = {bno:1043,page:1}
		let bno = param.bno;
		let page = param.page || 1;
		
		$.getJSON("/replies/pages/"+bno+"/"+page, function(result) {
			if(callback){
				callback(result.replyCnt,result.list);
			}
		})
	}//댓글 리스트 종료
	
	
	function remove(rno,callback){
		$.ajax({
			type : 'DELETE',
			url : '/replies/'+rno,
			success:function(result){
				if(callback){
					callback(result);
				}					
			}
		})
	}//댓글 삭제 종료
	
	function update(contents,callback){
		$.ajax({
			type:'put',
			url : '/replies/'+contents.rno,
			data : JSON.stringify(contents),
			contentType: "application/json;charset=utf-8",
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	}//댓글 수정 종료
	
	function get(rno,callback){
		$.getJSON("/replies/"+rno, function(result) {
			if(callback){
				callback(result);
			}
		})
	}//댓글 하나 가져오기 종료
	
	function displayTime(timeValue){
		let today = new Date();
		
		let gap = today.getTime() - timeValue;
		let dateObj = new Date(timeValue);
		let str = "";
		
		//오늘 작성한 댓글
		if(gap < (1000*60*60*24)){
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			
			return [(hh>9?'':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
		}else{ 
			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth()+1;
			let dd = dateObj.getDate();
			return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
		}
	}
	
	
	return {
		displayTime:displayTime,
		add:add,
		getList:getList,
		remove : remove,
		update : update,
		get : get
	};
	
})();












