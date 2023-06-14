package kr.co.godtrip.payment;

import java.sql.Timestamp;

public class PaymentDTO {
	private String paycode;
    private String id;
    private Timestamp payregdt;
    private String paysort;
    private int total;
    private String cardsort;
    private String cardowner;
    private String reservation_Name;
    
	public String getPaycode() {
		return paycode;
	}
	public void setPaycode(String paycode) {
		this.paycode = paycode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getPayregdt() {
		return payregdt;
	}
	public void setPayregdt(Timestamp payregdt) {
		this.payregdt = payregdt;
	}
	public String getPaysort() {
		return paysort;
	}
	public void setPaysort(String paysort) {
		this.paysort = paysort;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getCardsort() {
		return cardsort;
	}
	public void setCardsort(String cardsort) {
		this.cardsort = cardsort;
	}
	public String getCardowner() {
		return cardowner;
	}
	public void setCardowner(String cardowner) {
		this.cardowner = cardowner;
	}
	public String getReservation_Name() {
		return reservation_Name;
	}
	public void setReservation_Name(String reservation_Name) {
		this.reservation_Name = reservation_Name;
	}
	@Override
	public String toString() {
		return "PaymentDTO [paycode=" + paycode + ", id=" + id + ", payregdt=" + payregdt + ", paysort=" + paysort
				+ ", total=" + total + ", cardsort=" + cardsort + ", cardowner=" + cardowner + ", reservation_Name="
				+ reservation_Name + "]";
	}
    
    
}
