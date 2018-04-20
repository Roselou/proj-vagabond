class User < ApplicationRecord
  has_secure_password

  def create
    user_params = params.require(:user).permit(:name, :email, :username, :current_city, :avatar, :password)
    # confirm that email/password combination is correct
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
