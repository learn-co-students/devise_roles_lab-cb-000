module UsersHelper
  def user_email
    if @user.nil? || @user.email.nil?
      return ''
    else
      @user.email
    end
  end
end