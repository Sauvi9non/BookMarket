function CheckAddBook(){
	var bookId = document.getElementById("bookId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	//bookId 유효성 검사. ISBN으로 시작되고, 숫자를 포함하고 길이가 5~12자인지 검사
	if(!check(/^ISBN[0-9]{4,12}$/, bookId,
	"[상품 코드]\nISBN과 숫자를 조합하여 5~12자로 입력하세요.\n*ISBN으로 시작해야합니다.")) {
		return false;
	}
	
	//name(도서 이름)이 4~12자인지 검사
	if (name.value.length <4 || name.value.length > 12) {
		alert("[도서명]\n도서명은 4~12자여야 합니다.");
		name.select();
		name.focus();
		return false;
	}
	//unitPrice의 문자길이가 0인지, 숫자인지
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n가격은 숫자여야 합니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	//unitPrice이 음수인지 검사
	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/,unitPrice,"[가격]\n소수점 아래 둘째 자리까지만 입력해야 합니다.")) {
		return false;
	}
	
	//unitsInStock이 숫자인지 검사
	if(isNaN(unitsInStock.value)){
		alert("[재고 수]\n재고 수는 숫자여야 합니다.");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	

	function check(regExp,e,msg){
		if(regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newBook.submit();
	
}



