class User < ActiveRecord::Base
  extend Enumerize
  after_create :create_folder

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :news, dependent: :destroy
  has_many :disciplines

  enumerize :role, in: [:student, :admin, :teacher], default: :student, predicates: true

  validates :name, uniqueness: { case_sensitive: false }

  mount_uploader :avatar, AvatarUploader

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

  private

  def create_folder
    FileUtils::mkdir_p File.join(Rails.public_path, 'uploads', 'folder', id.to_s)
  end
end
