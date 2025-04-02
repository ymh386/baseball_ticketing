// list.js

// 팀별 우승 정보
const teamChampionships = {
    '기아 타이거즈': {
      championships: '우승 횟수: 12회 1983, 1986~1989, 1991, 1993, 1996, 1997, 2009, 2017, 2024'},
    'SSG 랜더스': {
      championships: '우승 횟수: 5회 (2007, 2008, 2010, 2018, 2022)'
    },
    '한화 이글스': {
      championships: '우승 횟수: 1회 (1999)'
    },
    '키움 히어로즈': {
      championships: '우승 횟수: - '
    },
    '삼성 라이온즈': {
      championships: '우승 횟수: 8회 (1985, 2002, 2005, 2006, 2011~2014)'
    },
    '롯데 자이언츠': {
      championships: '우승 횟수: 2회 (1984, 1992)'
    },
    '케이티 위즈': {
      championships: '우승 횟수: 1회 (2021)'
    },
    '엘지 트윈스': {
      championships: '우승 횟수: 3회 (1990, 1994, 2023)'
    },
    '엔씨 다이노스': {
      championships: '우승 횟수: 1회 (2020)'
    },
    '두산 베어스': {
      championships: '우승 횟수: 6회 (1982, 1995, 2001, 2015, 2016, 2019)'
    }
  };
  
  // 모달 열기 및 우승 정보 표시 함수
  $('#teamModal').on('show.bs.modal', function (event) {
    let button = $(event.relatedTarget); // 클릭된 버튼
    let teamName = button.data('team'); // 팀 이름
    let modal = $(this);
    
    // 해당 팀의 우승 정보 가져오기
    let teamData = teamChampionships[teamName] || { championships: '우승 정보가 없습니다.' };
  
    modal.find('#teamName').text('팀 이름: ' + teamName);
    modal.find('#championships').text(teamData.championships);
  });
  