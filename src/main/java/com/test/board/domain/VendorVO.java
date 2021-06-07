package com.test.board.domain;

public class VendorVO {

	private int uid;
	private String profile_pic;
	private String info_vendor;
	private String area;
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getProfile_pic() {
		return profile_pic;
	}
	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}
	public String getInfo_vendor() {
		return info_vendor;
	}
	public void setInfo_vendor(String info_vendor) {
		this.info_vendor = info_vendor;
	}
	@Override
	public String toString() {
		return "VendorVO [uid=" + uid + ", profile_pic=" + profile_pic + ", info_vendor=" + info_vendor + ", area="
				+ area + "]";
	}
	
	
	
	
}
