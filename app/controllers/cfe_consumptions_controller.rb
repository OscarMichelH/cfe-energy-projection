class CfeConsumptionsController < ApplicationController


  def new
  end


  def import
    CfeConsumption.import(params[:file])
    redirect_to new_cfe_consumption_path, notice: 'Datos actualizados correctamente'
  end

end
