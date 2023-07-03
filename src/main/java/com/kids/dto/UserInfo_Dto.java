package com.kids.dto;

import java.sql.Date;

import lombok.Data;

@Data //게터 세터 전부다 담아서 알아서 처리해줌! 
public class UserInfo_Dto {

    private String id;
    private String password;
    private String name;
    private String birthday;
    private String phoneNumber;
    private String postCode;
    private String address;
    private String detailAddress;
    private String extraAddress;    
    private String gender;
    private String email;
    private String userCode;
    private String regDate;
    
    //부모 폼
    private String CName;
    private String birthYear;
    private String CGender;
    private String personality;
    private String etc;
    
    //시니어
    private String info;
    private String area;
    //시니어 스케줄
    private String scheduleCode;
    private String status;
    private String workStatus;
    
    //약관
    
    private String agreeCode01;
    private String agreeCode02;
    private String agreeCode03;
    
//-----------------------------					    -----------------------------				-----------------------------
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public String getPassword() {
//		return password;
//	}
//	public void setPassword(String password) {
//		this.password = password;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public Date getBirthday() {
//		return birthday;
//	}
//	public void setBirthday(Date birthday) {
//		this.birthday = birthday;
//	}
//	public String getPhoneNumber() {
//		return phoneNumber;
//	}
//	public void setPhoneNumber(String phoneNumber) {
//		this.phoneNumber = phoneNumber;
//	}
//	public String getAddress() {
//		return address;
//	}
//	public void setAddress(String address) {
//		this.address = address;
//	}
//	public String getGender() {
//		return gender;
//	}
//	public void setGender(String gender) {
//		this.gender = gender;
//	}
//	public String getEmail() {
//		return email;
//	}
//	public void setEmail(String email) {
//		this.email = email;
//	}
//	public String getUserCode() {
//		return userCode;
//	}
//	public void setUserCode(String userCode) {
//		this.userCode = userCode;
//	}
//	public Date getRegDate() {
//		return regDate;
//	}
//	public void setRegDate(Date regDate) {
//		this.regDate = regDate;
//	}
//	
//    
//    
}
