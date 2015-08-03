class JobsController < ApplicationController
  def index
    @jobs = JobPosting.current_jobs
  end

  def show
    @job = JobPosting.find(params[:id])
  end

  def create
    @job = JobPosting.new(job_params)

    if @job.save
      redirect_to job_path(@job), notice: "Your job listing has been posted."
    else
      render :new
   end
  end

  def new
    @job = JobPosting.new()
  end

  private

  def job_params
    params.require(:job_posting).permit(
      :company,
      :title,
      :description,
      :how_to_apply,
      :full_time
    )
  end
end
