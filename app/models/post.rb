class Post < ActiveRecord::Base
  belongs_to :user

  def createable_by?(user)
    !user.nil?
  end

  def editable_by?(user)
    if user.nil?
      return false
    end

    user.admin? || user.vip? || self.user.id == user.id
  end

  def deleteable_by?(user)
    if user.nil?
      return false
    end

    user.admin? || self.user.id == user.id
  end
end
