class Post < ActiveRecord::Base
  attr_accessible :content, :title, :important

  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => true

  has_many :comments, :dependent => :destroy
  has_many :products

end
