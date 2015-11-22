class Girl < ActiveRecord::Base
  attr_accessible :comment, :img, :score, :studentName, :studentNo
  validates_presence_of :score


end
