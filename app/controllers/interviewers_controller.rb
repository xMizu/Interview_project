class InterviewersController < ApplicationController
  def index
    @interviewers = Interviewer.all
  end

  def show
    
    @interviewer = Interviewer.find(params[:id])
    @pending_interviews = @interviewer.interviews.where(status: "pending").order(:date)
    @confirmed_interviews = @interviewer.interviews.where(status: "confirmed").order(:date)
    @reschedule_interviews = @interviewer.interviews.where(status: "reschedule").order(:date)
  end

  def new
    @interviewer = Interviewer.new()
  end

  def create
    i = Interviewer.create(strong_interviewer_params)
    redirect_to interviewer_path(i)
  end
  
  def edit
    @interviewer = Interviewer.find(params[:id])
  end
  
  def update 
    interviewer = Interviewer.find(params[:id])
    interviewer.update(strong_interviewer_params)
    redirect_to interviewer_path(interviewer)
  end

  def destroy 
    interviewer = Interviewer.find(params[:id])
    interviewer.destroy
    redirect_to interviewers_path
  end

  def interview
    @interviewer = Interviewer.find(params[:id])
    @applicants = Applicant.all
    @interview = Interview.new()
    # render :interview
  end

  private
  def strong_interviewer_params
    params.require(:interviewer).permit(:name, :age, :email, :company)
  end

end
