class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      # redirect to /user/id -- user profile
      redirect_to @user
    else
      render 'new'
    end
  end

  private
     #  to just read the params allowed for the user and ignor the others sent from the view.
      def user_params
          params.require(:user).permit(:name, :email, :password,
                                       :password_confirmation)
      end
end
