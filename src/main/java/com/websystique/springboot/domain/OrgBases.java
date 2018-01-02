package com.websystique.springboot.domain;

public class OrgBases {

    private String baseName;
    private String baseParam;
    private String user;

    public OrgBases() {
    }

    public OrgBases(String baseName, String baseParam, String user) {
        this.baseName = baseName;
        this.baseParam = baseParam;
        this.user = user;
    }

    public String getBaseName() {
        return baseName;
    }

    public void setBaseName(String baseName) {
        this.baseName = baseName;
    }

    public String getBaseParam() {
        return baseParam;
    }

    public void setBaseParam(String baseParam) {
        this.baseParam = baseParam;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "OrgBases{" +
                "baseName='" + baseName + '\'' +
                ", baseParam='" + baseParam + '\'' +
                ", user='" + user + '\'' +
                '}';
    }
}
