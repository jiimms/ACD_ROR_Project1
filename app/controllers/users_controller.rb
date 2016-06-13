class UsersController < ApplicationController
  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
  		flash[:success]="Welcome to The Website"
  		redirect_to @user
  	else
  		flash.now[:danger]="Please correct the errors below"
  		render :new
  	end
  end

  def edit
  	@user=User.find(params[:id])
  end

  def update
  	@user=User.find(params[:id])
  	if @user.update(user_params)
  		flash[:success]="Details updated"
  		redirect_to users_path
  	end
  end

  def index
  	@user=User.all
  end

  def show
  	@user=User.find(params[:id])
  end

  def destroy
  	@user=User.find(params[:id])
  	@user.delete
  	redirect_to users_path
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password)
  	end
end
