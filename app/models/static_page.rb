class StaticPage < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true
  validates :name, presence: true
  validates :content, presence: true

  def to_param
    slug
  end
end
