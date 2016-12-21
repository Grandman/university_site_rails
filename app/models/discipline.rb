class Discipline < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :page, presence: true
end
