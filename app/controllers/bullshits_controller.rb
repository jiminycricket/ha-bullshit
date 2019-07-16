class BullshitsController < ApplicationController
  before_action :set_event, :only => [:show, :edit, :update, :destroy]
  def index
    @bullshits = Bullshit.all
  end

  def welcome
    randomBullshit
  end

  def new
    @bullshit = Bullshit.new
  end

  def create
    @bullshit = Bullshit.new(bullshit_params)
    @bullshit.save
    flash.notice = "成功建立 #{@bullshit.content}"
    redirect_to :action => :index
  end

  def show
  end

  def edit
  end

  def update
    @bullshit.update(bullshit_params)
    flash.notice = "成功編輯 #{@bullshit.content}"
    redirect_to :action => :index
  end

  def destroy
    @bullshit.destroy
    flash.notice = "成功刪除"
    redirect_to :action => :index
  end

  private

  def randomBullshit
    offset = rand(Bullshit.count)
    @bullshitRand = Bullshit.offset(offset).first
  end

  def bullshit_params
    params.require(:bullshit).permit(
      :content
    )
  end

  def set_event
    @bullshit = Bullshit.find(params[:id])
  end
end
