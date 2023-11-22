class EducationsController < ApplicationController

  def index
    @education = Education.all
  end

  def show
    @education = Education.new
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @education = Education.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @education = Education.new(education_params)
    @education.doctor = @doctor
    if @education.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  private

  def education_params
    params.require(:education).permit(:university, :degree_name, :score)
  end


end
