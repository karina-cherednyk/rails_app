class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :seller, :moderator, :admin]

  after_initialize :set_default_role, :if => :new_record?

  has_many :books, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def set_default_role
    self.role ||= :user
  end
end
