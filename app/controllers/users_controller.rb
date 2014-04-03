class UsersController < ApplicationController

  has_many :reviews

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id # auto log in
      redirect_to movies_path, notice: "Welcome aboard, friend! I believe your name is #{@user.firstname}. I know where you live. She's pretty."
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end


end
