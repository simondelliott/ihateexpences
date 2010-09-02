class UsersController < ApplicationController

  before_filter :find_user,
    :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new()
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
        flash[:notice] = 'User was successfully created.'
        redirect_to :action => 'index'
    else
        render :action => "new"
    end
  end

  def destroy
    @user.destroy
    redirect_to(users_url)
  end

def update

  if @user.update_attributes(params[:user])
    flash[:notice] = 'successfully updated.'
    redirect_to(@user)
  else
    render :action => "edit"
  end

end

  private
    def find_user
      # rails will always use id as the default for the first param passed
      # in on the query string 
      @user = User.find_by_username(params[:username])
    end

end
