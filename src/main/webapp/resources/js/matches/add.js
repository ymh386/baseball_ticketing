function checkFileType(filePath) {
    let fileFormat = filePath.split(".");
 
    if (fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1) {
      return true;
      } else {
      return false;
    }
  }
 
  function check() {
 
    let file = $("#excelFile").val();
 
    if (file == "" || file == null) {
    alert("파일을 선택해주세요.");
 
    return false;
    } else if (!checkFileType(file)) {
    alert("엑셀 파일만 업로드 가능합니다.");
 
    return false;
    }
 
    if (confirm("업로드 하시겠습니까?")) {
      let options = {
        success : function(data) {
          alert("모든 엑셀데이터가 적용되었습니다.");
          location.href = "./list";
        },
        type : "POST"
        };
      $("#excelUploadForm").ajaxSubmit(options);
    }
  }