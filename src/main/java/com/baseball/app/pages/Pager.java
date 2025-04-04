package com.baseball.app.pages;



public class Pager {	

//	//검색종류
//	private String kind;
//	
//	//검색어
//	private String search;
	
	private boolean endCheck;
	
	//시작 번호
	private Long startNum;
	
	//끝번호
	private Long endNum;
	
	//페이지 번호(파라미터 대입)
	private Long page;
	
	//페이지당 출력할 row의 갯수
	private Long perPage;
	
	
	// 첫 페이지 버튼 번호
	private Long startBtn;
	
	// 마지막 페이지 버튼 번호
	private Long endBtn;
	
	// 마지막 페이지 번호
	private Long lastPage;

//-------------------------------------------------	

	// 한번에 가져오는 리스트의 갯수와 시작 번호, 끝번호를 계산하는 메서드 makeListNum
	public void makeListNum(Long totalCount) {
		this.startNum = ((this.getPage()-1) * this.getPerPage()) + 1; // 1일 때 1, 2일 때 4, 3일 때 7
		this.endNum = this.getPage() * this.getPerPage(); // 1일 때 3, 2일 때 6, 3일 때 9		
	}
//-------------------------------------------------
		
	public Long getPage() {
		System.out.println("page의 값은 : " + page);
		// 적절한 값 없을 시 첫번째 페이지로 간다
		if(this.page == null || this.page < 1 || this.page > this.lastPage) {
			this.page=1L;
		}
		
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

//-------------------------------------------------

	public Long getPerPage() {
		// 페이지당 가져오는 리스트 수 3개로 초기화
		if(this.perPage == null) {
			this.perPage=5L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
//-------------------------------------------------	
	
	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getEndNum() {
		return endNum;
	}

	public void setEndNum(Long endNum) {
		this.endNum = endNum;
	}
	
//-------------------------------------------------

	public boolean isEndCheck() {
		return endCheck;
	}

	public void setEndCheck(boolean endCheck) {
		this.endCheck = endCheck;
	}

//-------------------------------------------------	
	
	// 페이징 로직에 쓸 페이지와 블록 등을 계산한다
	public void Calculate_PageAndBlock(Long totalCount) {
				
		if(totalCount < 1) {
			totalCount = 1L;
		}

		//1. TotalPage 총 페이지 갯수 구하기
		Long totalPage = totalCount/5;
		if(totalCount%5 != 0) { // 나머지가 있으면 +1
			totalPage++;
		}
		this.lastPage = totalPage;
		
		//2. TotalBlock 총 블록 갯수 구하기
		Long totalBlock = totalPage/5;
		if(totalPage%5 != 0) {
			totalBlock++;
		}
		
		//3. page번호로 Block 번호 구하기
		Long curBlock = this.getPage()/5;
		
		if(this.getPage()%5 != 0) { // 나머지가 있으면 +1
			curBlock++;
		}
		
		//4. Block번호로 시작 버튼 번호, 마지막 버튼 번호 계산
		Long start = (curBlock-1)*5+1;
		Long end = curBlock*5;
		
		this.setStartBtn(start);
		this.setEndBtn(end);
		
		//5. 실제로는 없는 페이지가 생기지 않도록 해준다. 현재 블럭이 마지막 블럭이라면 EndBtn에 마지막 페이지 값을 넣어준다.
		//  
		if(totalBlock == curBlock) {
			this.setEndBtn(totalPage);
			this.setEndCheck(true);
		}
		
		
	}

//-------------------------------------------------

		public Long getStartBtn() {
			return startBtn;
		}

		public void setStartBtn(Long startBtn) {
			this.startBtn = startBtn;
		}

		public Long getEndBtn() {
			return endBtn;
		}

		public void setEndBtn(Long endBtn) {
			this.endBtn = endBtn;
		}

//-------------------------------------------------

	//
//	public String getKind() {
//		if(this.kind ==null) {
//			this.kind="k1";
//		}
//		return kind;
//	}
//
//	public void setKind(String kind) {
//		this.kind = kind;
//	}
//
//	public String getSearch() {
//		if(this.search == null) {
//			this.search="";//빈문자열
//		}
//		return search;
//	}
//
//	public void setSearch(String search) {
//		this.search = search;
//	}
//

	

}
