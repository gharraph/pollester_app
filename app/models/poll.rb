class Poll < ActiveRecord::Base
  attr_accessible :link, :name
  has_many :questions

  def to_param
    link
  end
  
end
