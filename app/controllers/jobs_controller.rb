class JobsController < ApplicationController
  def show
    @job = JobPosting.find(params[:id])
  end
end
