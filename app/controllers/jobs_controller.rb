class JobsController < ApplicationController
  def index
    @jobs = JobPosting.current_jobs
  end

  def show
    @job = JobPosting.find(params[:id])
  end
end
