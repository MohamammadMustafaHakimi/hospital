class PatientsController < ApplicationController
  before_action :patient_finder, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
    redirect_to patients_path
  end

  def show
  end

  def edit
  end

  def update
    @patient.update(patient_params)
    redirect_to patient_path(@patient)
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, status: :see_other
  end

  private
  def patient_finder
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :insurance)
  end

end
