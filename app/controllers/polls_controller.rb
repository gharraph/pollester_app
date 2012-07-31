class PollsController < ApplicationController
  def new
    @poll = Poll.new
  end
  
  def create
    rand_link_rep = SecureRandom.base64(8).gsub(/\W/, '')
    @poll = Poll.create(:name => params[:poll][:name], :link => rand_link_rep)
    flash[:message]  = "Poll is created successfully. 
    if you like to edit your poll please do through this link : #{poll_url(@poll.link)}"
    redirect_to root_path
  end
  
  def show
    @poll = Poll.find_by_link(params[:link])
  end
  
  def edit
    @poll = Poll.find_by_link(params[:link])
  end
  
  def update
    @poll = Poll.find_by_link(params[:id])
    @poll.update_attributes(:name => params[:poll][:name])
    flash[:message]  = "Poll is updated successfully.
    if you like to edit your poll please do through this link : #{poll_url(@poll.link)}" 
    redirect_to root_path
  end
end
