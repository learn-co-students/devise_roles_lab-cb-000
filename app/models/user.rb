class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  after_initialize :set_default_role
  enum role: %i[user vip admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def set_default_role
    self.role ||= 'user'
  end
end
