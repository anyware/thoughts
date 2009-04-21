class Thought < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :description, :on => :create, :message => "can't be blank"
  validates_presence_of :user, :on => :create, :message => "can't be blank"
end
