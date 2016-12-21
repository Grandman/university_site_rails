class StaticPage < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true, format: { with: %r{([aA-zZ0-9_-]+/*)+}, message: 'неправильный формат' }
  validates :name, presence: true
  validates :content, presence: true

  def to_param
    slug
  end
end
