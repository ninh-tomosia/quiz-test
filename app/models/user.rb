class User < ApplicationRecord
  # binding.pry
  validates :name, presence: true, format: { with: /\A[^0-9`.,~!@#\$%\^&*+_=]+\z/i, message: "only allows letters" }
  validates :phone,presence: false, default: nil, format: { with: /\d[0-9]\)*\z/, message: "only allows numbers"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image, AvatarUploader
  attr_accessor :remove_image
  
end
