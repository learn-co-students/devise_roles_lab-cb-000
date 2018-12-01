class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]

  def viewable?
    if self.role.nil?
      return false
    else
      return self.user? || self.vip? || self.admin?
    end
  end

  def id_is?(id)
    self.id == id.to_i
  end
end
