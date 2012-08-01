class PollsController < ApplicationController
  def new
    @poll = Poll.new
  end
  
  def create 
    @poll = Poll.create(:name => params[:poll][:name], 
      :link => SecureRandom.base64(8).gsub(/\W/, ''))
      flash[:message]  = "Poll is created successfully."
      redirect_to new_poll_question_path(@poll)
  end
  
  def show
    @poll = Poll.find_by_link(params[:link])
  end
  
  def edit
    @poll = Poll.find_by_link(params[:link])
  end
  
  def update
    @poll = Poll.find_by_link(params[:id])
    if @poll.update_attributes(:name => params[:poll][:name])
      flash[:message]  = "Poll is updated successfully. if you like to edit your poll please do through this link : #{poll_url(@poll.link)}" 
      redirect_to root_path
    end
  end
end
