package model;

public class JobUpdateModel {
    private String jobId;
    private String jobName;
    private String company_Name;
    private String email;
    private String phone;
    private String city;
    private String state;
  private String salary;
  private String startDate;
  private String endDate;
  private String jobtype;
  private String jobAdder;
    private String jobDescription;
    private byte[] cimg;

    public JobUpdateModel(String jobId,String jobName,String company_Name,String city,String state,String salary,String jobtype,String jobAdder,String jobDescription,String startDate,String endDate,String email,String phone,byte[] cimg) {
        this.jobId = jobId;
        this.jobName = jobName;
        this.company_Name = company_Name;
        this.city = city;
        this.state = state;
        this.salary = salary;
        this.jobtype = jobtype;
        this.jobAdder = jobAdder;
        this.jobDescription = jobDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.email = email;
        this.phone = phone;
        this.cimg = cimg;


    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getCompany_Name() {
        return company_Name;
    }

    public void setCompany_Name(String company_Name) {
        this.company_Name = company_Name;
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

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getJobtype() {
        return jobtype;
    }

    public void setJobtype(String jobtype) {
        this.jobtype = jobtype;
    }

    public String getJobAdder() {
        return jobAdder;
    }

    public void setJobAdder(String jobAdder) {
        this.jobAdder = jobAdder;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
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

    public byte[] getCimg() {
        return cimg;
    }

    public void setCimg(String cimg) {
        this.cimg = cimg.getBytes();
    }
}
