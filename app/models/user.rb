class User < ActiveRecord::Base
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :news

  enumerize :role, in: [:student, :admin, :teacher], default: :student, predicates: true

  def active_for_authentication?
    super && approve?
  end

  def inactive_message
    if !approve?
      :not_approved
    else
      super # Use whatever other message
    end
  end
end
