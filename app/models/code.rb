class Code < ActiveRecord::Base

  has_many :registers

  validates_uniqueness_of :code


end
