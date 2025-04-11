package com.baseball.app.Excels;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.util.CellReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ExcelCellRef {
	
	private static final Logger logger= 
            LoggerFactory.getLogger(ExcelCellRef.class);
	
	/**
     * Cell에 해당하는 Column Name을 가져온다(A,B,C..)
     * 만약 Cell이 Null이라면 int cellIndex의 값으로
     * Column Name을 가져온다.
     * @param cell
     * @param cellIndex
     * @return
     */
    public static String getName(Cell cell, int cellIndex) {
        int cellNum = 0;
        if(cell != null) {
            cellNum = cell.getColumnIndex();
        }
        else {
            cellNum = cellIndex;
        }
        return CellReference.convertNumToColString(cellNum);
    }
    
    // @SuppressWarnings 경고 제외시키는 옵션 (deprecation : 사용하지 말아야 할 메소드 관련 경고 억제)
    @SuppressWarnings("deprecation")
    public static String getValue(Cell cell) {
        String value = "";
 
        if(cell == null) {
            value = "";
        }
        else {
            if( cell.getCellType() == CellType.FORMULA) {
                value = cell.getCellFormula();
            }
            else if( cell.getCellType() == CellType.NUMERIC ) {
            	if(DateUtil.isCellDateFormatted(cell)) {
            		Date date = cell.getDateCellValue();
            		value = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
            	} else {
            		value = cell.getNumericCellValue() + "";	
            	}
            }
            else if( cell.getCellType() == CellType.STRING ) {
                value = cell.getStringCellValue();
            }
            else if( cell.getCellType() == CellType.BOOLEAN ) {
                value = cell.getBooleanCellValue() + "";
            }
            else if( cell.getCellType() == CellType.ERROR ) {
                value = cell.getErrorCellValue() + "";
            }
            else if( cell.getCellType() == CellType.BLANK ) {
                value = "";
            }
            else {
                value = cell.getStringCellValue();
            }
        }
        return value.trim();
    }

}
