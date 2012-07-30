class PollsController < ApplicationController
  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.create(:name => params[:poll][:name])
    redirect_to root_path
  end
end
