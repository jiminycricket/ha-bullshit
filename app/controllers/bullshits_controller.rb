class BullshitsController < ApplicationController
  def show
    @bullshits = Bullshit.all
  end

  def new
    @bullshit = Bullshit.new
  end

  def create
    @bullshit = Bullshit.new(bullshot_params)
    @bullshit.save
    redirect_to :action => :show
  end

  def bullshot_params
    params.require(:bullshit).permit(
      :content
    )
  end
end
