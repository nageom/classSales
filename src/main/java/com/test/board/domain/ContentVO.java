package com.test.board.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("ContentVO")
public class ContentVO {
	private int cid;
	private String big_name;
	private String small_name;
	private int uid;
	private int on_off;
	private int att_num;
	private int price;
	private String area;
	private String title;
	private String content;
	private String video;
	private String vthumbnail;
	private String cthumbnail;
	private String pic_content;
	private String file_name;
	private Date condate;
	private MultipartFile uploadFile;
	private MultipartFile cthumbFile;
	private MultipartFile picFile;
	private String nickName;
	
	public ContentVO() {}

	public ContentVO(int cid, String big_name, String small_name, int uid, int on_off, int att_num, int price,
			String area, String title, String content, String video, String vthumbnail, String cthumbnail,
			String pic_content, String file_name, Date condate, MultipartFile uploadFile, MultipartFile cthumbFile,
			MultipartFile picFile) {
		super();
		this.cid = cid;
		this.big_name = big_name;
		this.small_name = small_name;
		this.uid = uid;
		this.on_off = on_off;
		this.att_num = att_num;
		this.price = price;
		this.area = area;
		this.title = title;
		this.content = content;
		this.video = video;
		this.vthumbnail = vthumbnail;
		this.cthumbnail = cthumbnail;
		this.pic_content = pic_content;
		this.file_name = file_name;
		this.condate = condate;
		this.uploadFile = uploadFile;
		this.cthumbFile = cthumbFile;
		this.picFile = picFile;
		
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getBig_name() {
		return big_name;
	}

	public void setBig_name(String big_name) {
		this.big_name = big_name;
	}

	public String getSmall_name() {
		return small_name;
	}

	public void setSmall_name(String small_name) {
		this.small_name = small_name;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getOn_off() {
		return on_off;
	}

	public void setOn_off(int on_off) {
		this.on_off = on_off;
	}

	public int getAtt_num() {
		return att_num;
	}

	public void setAtt_num(int att_num) {
		this.att_num = att_num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getVthumbnail() {
		return vthumbnail;
	}

	public void setVthumbnail(String vthumbnail) {
		this.vthumbnail = vthumbnail;
	}

	public String getCthumbnail() {
		return cthumbnail;
	}

	public void setCthumbnail(String cthumbnail) {
		this.cthumbnail = cthumbnail;
	}

	public String getPic_content() {
		return pic_content;
	}

	public void setPic_content(String pic_content) {
		this.pic_content = pic_content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public Date getCondate() {
		return condate;
	}

	public void setCondate(Date condate) {
		this.condate = condate;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public MultipartFile getCthumbFile() {
		return cthumbFile;
	}

	public void setCthumbFile(MultipartFile cthumbFile) {
		this.cthumbFile = cthumbFile;
	}

	public MultipartFile getPicFile() {
		return picFile;
	}

	public void setPicFile(MultipartFile picFile) {
		this.picFile = picFile;
	}
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "ContentVO [cid=" + cid + ", big_name=" + big_name + ", small_name=" + small_name + ", uid=" + uid
				+ ", on_off=" + on_off + ", att_num=" + att_num + ", price=" + price + ", area=" + area + ", title="
				+ title + ", content=" + content + ", video=" + video + ", vthumbnail=" + vthumbnail + ", cthumbnail="
				+ cthumbnail + ", pic_content=" + pic_content + ", file_name=" + file_name + ", condate=" + condate
				+ ", uploadFile=" + uploadFile + ", cthumbFile=" + cthumbFile + ", picFile=" + picFile + "]";
	}
	
	
}
