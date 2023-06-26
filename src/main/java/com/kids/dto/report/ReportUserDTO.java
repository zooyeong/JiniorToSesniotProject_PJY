package com.kids.dto.report;

import lombok.Data;

import java.util.Date;

@Data
public class ReportUserDTO {
    private int reportNum;
    private String parentId;
    private String seniorId;
    private String name;
    private String reportedReason;
    private Date reportDate;
    private String reportConfirmStatus;
    private int reportCount;

    // Add getters and setters
}
