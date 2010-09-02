class ExpencesController < ApplicationController

 #before_filter :find_expence, :only => [:show, :edit, :update, :destroy]

  def index
    logger.debug "[info]ExpencesController.index called"
    @user = User.find_by_username(params[:username])
    logger.debug "[info]  user found"
    @expences = @user.expences
  end

  def show
    logger.debug "[info]ExpencesController.show called"
    @user = User.find_by_username(params[:username])
  end

  def new
    logger.debug "[info]ExpencesController.new called"
    @user = User.find_by_username(params[:username])
    @expence = @user.expences.build
  end

  def edit
  end

  def create
    logger.debug "[info]create called"
    @user = User.find_by_username(params[:username])
    @expence = @user.expences.build(params[:expence])
    #@expence = Expence.new(params[:expence])
    if @expence.save
        flash[:notice] = 'Expence was successfully created.'
        redirect_to :action => 'index'
    else
        render :action => "new"
    end
  end

  def destroy
    @expence.destroy
    redirect_to(expences_url)
  end

def update

  if @expence.update_attributes(params[:expence])
    flash[:notice] = 'successfully updated.'
    redirect_to(@expence)
  else
    render :action => "edit"
  end
  
end

  private
    def find_expence
      @user = User.find_by_username(params[:username])
      @expence = Expence.find(params[:id])
    end

end
