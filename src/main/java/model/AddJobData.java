package model;

public class AddJobData {
    private String r_id;
    private String jobTitle;
    private String minsalary;
    private String maxsalary;
    private String EmploymentType;
    private String jobdesc;
    private String Qualificaton_skill;
    private String Benefites;
    private String jobAdder;

    private byte[] Hpimg;

    public AddJobData(String rId, String jobTitle, String employmentType, String minsalary, String maxsalary, String jobdesc, String qualificationSkill, String benefits, byte[] posterimg, String jobAdder) {
        this.r_id=rId;
        this.jobTitle = jobTitle;
        this.minsalary = minsalary;
        this.maxsalary = maxsalary;
        this.EmploymentType = employmentType;
        this.jobdesc = jobdesc;
        this.Qualificaton_skill = qualificationSkill;
        this.Benefites = benefits;
        this.jobAdder = jobAdder;
        this.Hpimg = posterimg;
    }

    // Getters and Setters


    public String getR_id() {
        return r_id;
    }

    public void setR_id(String r_id) {
        this.r_id = r_id;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getMinsalary() {
        return minsalary;
    }

    public void setMinsalary(String minsalary) {
        this.minsalary = minsalary;
    }

    public String getMaxsalary() {
        return maxsalary;
    }

    public void setMaxsalary(String maxsalary) {
        this.maxsalary = maxsalary;
    }

    public String getEmploymentType() {
        return EmploymentType;
    }

    public void setEmploymentType(String employmentType) {
        EmploymentType = employmentType;
    }

    public String getJobdesc() {
        return jobdesc;
    }

    public void setJobdesc(String jobdesc) {
        this.jobdesc = jobdesc;
    }

    public String getQualificaton_skill() {
        return Qualificaton_skill;
    }

    public void setQualificaton_skill(String qualificaton_skill) {
        Qualificaton_skill = qualificaton_skill;
    }

    public String getBenefites() {
        return Benefites;
    }

    public void setBenefites(String benefites) {
        Benefites = benefites;
    }

    public String getJobAdder() {
        return jobAdder;
    }

    public void setJobAdder(String jobAdder) {
        this.jobAdder = jobAdder;
    }

    public byte[] getHpimg() {
        return Hpimg;
    }

    public void setHpimg(byte[] hpimg) {
        Hpimg = hpimg;
    }
}
