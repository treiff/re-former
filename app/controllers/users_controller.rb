class UsersController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Save worked!"
      redirect_to new_user_path
    else
      flash.now[:error] = "That's not going to work."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Yay! Updated!"
      redirect_to edit_user_path(@user)
    else
      flash.now[:error] = "You messed up! try again."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
