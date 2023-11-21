class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.save
    redirect_to doctors_path
  end

  def show
    # @doctor = Doctor.find(params[:id])
  end

  def edit
    # @doctor = Doctor.find(params[:id])
  end

  def update
    # @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
    redirect_to doctor_path(@doctor)
  end

  def destroy
    # @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path, status: :see_other
  end

  private
  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :title, :available, :specialty, :experience)
  end
end
