class Poll < ActiveRecord::Base
  attr_accessible :link, :name
  has_many :questions
end
