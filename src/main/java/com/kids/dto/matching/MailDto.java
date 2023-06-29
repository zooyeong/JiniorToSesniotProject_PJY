package com.kids.dto.matching;

import lombok.Data;

@Data
public class MailDto {
	int no;
	String revId;
	String sendId;
	String content;
	int matchingNumber;
	String status;
	String sendTime;
}
