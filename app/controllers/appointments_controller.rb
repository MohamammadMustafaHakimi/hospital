class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    @patient = Patient.find(params[:patient_id])
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.patient = @patient
    if @appointment.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end


  private

  def appointment_params
    params.require(:appointment).permit(:cause, :urgent, :date, :doctor_id)
  end
end
