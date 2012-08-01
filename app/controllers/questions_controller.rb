class QuestionsController < ApplicationController
  def new
    @poll = Poll.find_by_link(params[:poll_id])
    @question = @poll.questions.new
  end
  
  def create
    @poll = Poll.find_by_link(params[:poll_id])
    @question = @poll.questions.create(:question => params[:question][:question])
    if params[:add_to_poll]
      redirect_to new_poll_question_path
    else
      redirect_to poll_path(@poll.link)
    end
  end
  
  def edit
    @poll = Poll.find_by_link(params[:poll_id])
    @question = Question.find(params[:id])
  end
  
  def update
     @poll = Poll.find_by_link(params[:poll_id])
     @question = Question.find(params[:id])
     @question.update_attributes(:question => params[:question][:question])
     redirect_to poll_path(@poll.link)
  end
  
  def destroy
     @poll = Poll.find_by_link(params[:poll_id])
     @question = Question.find(params[:id])
     @question.delete
     redirect_to poll_path(@poll.link)
  end
  
end
