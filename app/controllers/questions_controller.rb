class QuestionsController < ApplicationController
  def new
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.new
  end
  
  def create
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.create(:question => params[:question][:question])
    if params[:add_to_poll]
      redirect_to new_poll_question_path
    else
      redirect_to poll_path(@poll.link)
    end
  end
  
end
