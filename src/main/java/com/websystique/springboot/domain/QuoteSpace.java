package com.websystique.springboot.domain;

public class QuoteSpace {

    private String user;
    private Double diskSpaceUsed;

    public QuoteSpace() {
    }

    public QuoteSpace(String user, Double diskSpaceUsed) {
        this.user = user;
        this.diskSpaceUsed = diskSpaceUsed;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Double getDiskSpaceUsed() {
        return diskSpaceUsed;
    }

    public void setDiskSpaceUsed(Double diskSpaceUsed) {
        this.diskSpaceUsed = diskSpaceUsed;
    }

    @Override
    public String toString() {
        return "QuoteSpace{" +
                "user='" + user + '\'' +
                ", diskSpaceUsed=" + diskSpaceUsed +
                '}';
    }
}
