package com.websystique.springboot.domain;

public class Organisation {

    private String displayName;
    private String distinguishedName;

    public Organisation(String displayName, String distinguishedName) {
        this.displayName = displayName;
        this.distinguishedName = distinguishedName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getDistinguishedName() {
        return distinguishedName;
    }

    public void setDistinguishedName(String distinguishedName) {
        this.distinguishedName = distinguishedName;
    }

    @Override
    public String toString() {
        return "Organisation{" +
                "displayName='" + displayName + '\'' +
                ", distinguishedName='" + distinguishedName + '\'' +
                '}';
    }
}
