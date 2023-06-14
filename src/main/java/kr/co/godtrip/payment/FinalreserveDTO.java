package kr.co.godtrip.payment;

public class FinalreserveDTO {

		private int fno;
		private String paycode;
		private String transpro_code;
		private String transinfo;
		private String room_code;
		int hotelinfo;
		public int getFno() {
			return fno;
		}
		public void setFno(int fno) {
			this.fno = fno;
		}
		public String getPaycode() {
			return paycode;
		}
		public void setPaycode(String paycode) {
			this.paycode = paycode;
		}
		public String getTranspro_code() {
			return transpro_code;
		}
		public void setTranspro_code(String transpro_code) {
			this.transpro_code = transpro_code;
		}
		public String getTransinfo() {
			return transinfo;
		}
		public void setTransinfo(String transinfo) {
			this.transinfo = transinfo;
		}
		public String getRoom_code() {
			return room_code;
		}
		public void setRoom_code(String room_code) {
			this.room_code = room_code;
		}
		public int getHotelinfo() {
			return hotelinfo;
		}
		public void setHotelinfo(int hotelinfo) {
			this.hotelinfo = hotelinfo;
		}
		@Override
		public String toString() {
			return "finalreserveDTO [fno=" + fno + ", paycode=" + paycode + ", transpro_code=" + transpro_code
					+ ", transinfo=" + transinfo + ", room_code=" + room_code + ", hotelinfo=" + hotelinfo + "]";
		}
		
		
	}
