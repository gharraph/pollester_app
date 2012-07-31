class Question < ActiveRecord::Base
  attr_accessible :poll_id, :question
  belongs_to :poll
end
