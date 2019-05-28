class V1::TelemetriesController < ApplicationController
  before_action :set_car, only: [:create]

  def create
    @telemetry = @car.telemetry.build(telemetry_params)

    if @telemetry.save
      render json:  @telemetry, status: :created
    else
      render json: {status: 'ERROR', message: 'Telemetry not saved', 
                    data: @telemetry.errors}, status: :unprocessable_entity
    end  
  end  

  private

  def telemetry_params
    params.require(:telemetry).
      permit(:car__id, :oil_level, :speed, :ignition, :latitude, :longtitude,
             :engine_started, :lights, :altitude, :device_id)
  end  

  def set_car
    @car = Car.find(params[:car_id])
  end

end
