class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :users

  after_validation :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum :role => [:user, :admin, :vip]

  private

  def set_default_role
      self.role = "user" if self.role.nil?
  end
end
