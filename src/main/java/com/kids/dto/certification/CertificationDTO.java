package com.kids.dto.certification;

import lombok.Data;

@Data
public class CertificationDTO {
    private String idcpicture;
    private String cmnpicture;
    private String id;
    private String verificationStatus;

    // Constructors, getters, and setters (omitted for brevity)

    public CertificationDTO(String idcpicture, String cmnpicture, String verificationStatus, String id) {
        this.idcpicture = idcpicture;
        this.cmnpicture = cmnpicture;
        this.verificationStatus = verificationStatus;
        this.id = id;
    }
}
