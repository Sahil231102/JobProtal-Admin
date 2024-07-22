package model;

public class AddJobData {
    private String jobname;
    private String companyname;
    private String city;
    private String state;
    private String email;
    private String phone;
    private String salary;
    private String jobtype;
    private String startdate;
    private String enddate;
    private String jobdesc;
    private String jobAdder;
    private byte[] cimg;

    public AddJobData(String jobname, String companyname, String city, String state, String email, String phone, String salary, String jobtype, String startdate, String enddate, String jobdesc, String jobAdder, byte[] cimg) {
        this.jobname = jobname;
        this.companyname = companyname;
        this.city = city;
        this.state = state;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
        this.jobtype = jobtype;
        this.startdate = startdate;
        this.enddate = enddate;
        this.jobdesc = jobdesc;
        this.jobAdder = jobAdder;
        this.cimg = cimg;
    }

    // Getters and Setters
    public String getJobname() {
        return jobname;
    }

    public void setJobname(String jobname) {
        this.jobname = jobname;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getJobtype() {
        return jobtype;
    }

    public void setJobtype(String jobtype) {
        this.jobtype = jobtype;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getJobdesc() {
        return jobdesc;
    }

    public void setJobdesc(String jobdesc) {
        this.jobdesc = jobdesc;
    }

    public String getJobAdder() {
        return jobAdder;
    }

    public void setJobAdder(String jobAdder) {
        this.jobAdder = jobAdder;
    }

    public byte[] getCimg() {
        return cimg;
    }

    public void setCimg(String cimg) {
        this.cimg = cimg.getBytes();
    }
}