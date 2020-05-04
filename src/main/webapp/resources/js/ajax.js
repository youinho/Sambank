function encodeAscii(str) {
	var ret = "";
	var value = escape(str);
	var match, re = /%u([0-9A-F]{4})/i;
	while((match = value.match(re))) {
		var num = Number("0x"+match[1]);
		var newVal = escape("&#" + num + ";");
		ret += value.substring(0, match.index) + newVal;
		value = value.substring(match.index+match[0].length);
	}
	ret += value.replace(/\+/g, "%2B");
	return ret;
}

var net=new Object();
net.READY_STATE_UNINITIALIZED=0;
net.READY_STATE_LOADING=1;
net.READY_STATE_LOADED=2;
net.READY_STATE_INTERACTIVE=3;
net.READY_STATE_COMPLETE=4;
net.ContentLoader=function(url,onload,onerror){
	this.url=url;
	this.req=null;
	this.onload=(onload) ? onload : this.defaultOnload;
	this.onerror=(onerror) ? onerror : this.defaultError;
	this.loadXMLDoc(url);
}
net.ContentLoader.prototype={
	loadXMLDoc:function(url){
		if (window.XMLHttpRequest){
			this.req=new XMLHttpRequest();
		} else if (window.ActiveXObject){
			this.req=new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (this.req){
			try{
				var loader=this;
				this.req.onreadystatechange=function(){
					loader.onReadyState.call(loader);
				}
				this.req.open('GET',url,true);
				this.req.send(null);
			}catch (err){
				this.onerror.call(this);
			}
		}
	},
	onReadyState:function(){
		var req=this.req
		var ready=req.readyState
		if (ready==net.READY_STATE_COMPLETE){
			var httpStatus=req.status
			if (httpStatus==200 || httpStatus==0){
				this.onload(req.responseText)
			}else{
				//http://support.microsoft.com/kb/193625
				// 12029: connection timed out
				// 12031: connection closed
				this.onerror.call(httpStatus, this)
			}
		}
	},
	defaultOnload:function(){
	},
	defaultError:function(timedOut, conn){
		//alert(connectionClosedNotice)
	}
}