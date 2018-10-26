class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :rememberable, :validatable
  enum role: [:user, :vip, :admin]
  after_initialize :assign_default_role, if: :new_record?

  private
    def assign_default_role
      self.role ||= :user
    end
end
