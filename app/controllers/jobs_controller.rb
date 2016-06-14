class JobsController < ApplicationController
  def index
    @q = JobPosting.current_jobs.ransack(params[:q])
    @jobs = @q.result(distinct: true)
  end

  def show
    @job = JobPosting.find(params[:id])
  end

  def create
    @job = JobPosting.new(job_params)

    unless @job.email.blank?
      redirect_to root_path, notice: t('job_listing.sorry')
      return
    end

    # Collect and cache information required for future moderation actions
    @job.attributes = {
      user_ip: request.env['REMOTE_ADDR'],
      user_agent: request.env['HTTP_USER_AGENT'],
      referrer: request.env['HTTP_REFERER']
    }
    @job.akismet_spam = @job.spam?

    if @job.save
      if @job.akismet_spam
        redirect_to job_path(@job), alert: t('job_listing.posted_moderation')
      else
        redirect_to job_path(@job), notice: t('job_listing.posted')
      end
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
      :description,
      :email,
      :full_time,
      :how_to_apply,
      :title
    )
  end
end
