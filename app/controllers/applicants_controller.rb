class ApplicantsController < ApplicationController
    def index
      @applicants = Applicant.all
  end

  def show
      @applicant = Applicant.find(params[:id])
      @pending_interviews = @applicant.interviews.where(status: "pending").order(:date)
      @confirmed_interviews = @applicant.interviews.where(status: "confirmed").order(:date)
  end

  def new
    @applicant = Applicant.new
  end
  
  def create
    @applicant = Applicant.new applicant_params
    if @applicant.valid?
      applicant.save
      flash[:message] = "#{@applicant.name} created" 
      redirect_to @applicant
    else
      flash.now[:message] = @applicant.errors.full_message
      render :new
    end
  end

  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy
    redirect_to applicants_path
  end

  def edit
    @applicant = Applicant.find(params[:id])
  end

  def update
    @applicant = Applicant.find(params[:id])
    @applicant.update applicant_params
    redirect_to @applicant
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name,:age,:email)
  end
end
