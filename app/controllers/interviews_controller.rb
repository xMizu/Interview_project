class InterviewsController < ApplicationController  
  def index
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])


  end

  def create
    interview = Interview.create(interview_params)
    interview.update(status: 'pending', message: '')
    redirect_to interview
  end


  def update
    @interview = Interview.find(params[:id])
    @interview.update(date: params[:interview][:date], status: 'pending')
    redirect_to @interview.interviewer
  end

  def change_status
    @interview = Interview.find(params[:id])
    @applicant = @interview.applicant
    @interview.update(status: params[:status],message: params[:message])
    if @interview.status == 'declined'
      @interview.destroy
    end
      redirect_to applicant_path(@applicant)
  end

  def destroy
    byebug
    interview = Interview.find(params[:id])
    interviewer = interview.interviewer
    interview.destroy
    redirect_to interviewer
  end


  private

  def interview_params
    params.require(:interview).permit(:interviewer_id,:applicant_id,:date)
  end
end
