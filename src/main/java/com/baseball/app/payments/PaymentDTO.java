package com.baseball.app.payments;

import java.util.Date;

public class PaymentDTO {

	private String paymentId;
	private String paymentStatus;
	private String productName;
	private Long totalAmount;
	private String merchantPaykey;
	private Date paymentDate;
	
	
	
	
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Long totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getMerchantPaykey() {
		return merchantPaykey;
	}
	public void setMerchantPaykey(String merchantPaykey) {
		this.merchantPaykey = merchantPaykey;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	
	
	
	
	
}