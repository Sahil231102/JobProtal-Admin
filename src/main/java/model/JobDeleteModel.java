package model;

public class JobDeleteModel {
    private String jobId;

   public  JobDeleteModel(String id)
   {
       this.jobId= id;
   }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }
}
