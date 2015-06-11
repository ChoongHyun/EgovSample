package egovframework.sample.service;

public class SampleVO {

    private int id;
    private String name;
    private String department;
    private String gender;
    private String introduce;
    private String reguser;

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getReguser() {
        return reguser;
    }

    public void setReguser(String reguser) {
        this.reguser = reguser;
    }
}
