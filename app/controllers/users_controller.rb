class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.order(sort_column + ' ' + sort_direction)
    params.delete(:search) if params[:clear]
    if params[:search]
      match = "%#{params[:search]}%"
      @users = @users.where{ (first_name =~ match) | (last_name =~ match) }
    end
  end

  def show
    render 'users/edit'
  end

  def edit
  end

  def update
    #TODO FInd a better way to do this. Most of this logic is copied from devise so we can use protected attributes properly

    current_password = params[:user].delete(:current_password)

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
    end

    if current_password and (@user.valid_password?(current_password) or current_user.admin?)
      result = @user.update_attributes(params[:user], :as => current_user.admin? ? :admin : nil)
    elsif not current_password.blank?
      @user.attributes = params[:user]
      @user.valid?
      @user.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      result = false
    else
      result = @user.update_attributes(params[:user], :as => current_user.admin? ? :admin : nil)
    end

    if result
      flash[:notice] = 'User was successfully updated.'
      sign_in :user, @user, :bypass => true if current_user == @user
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  def destroy
    # TODO what if the users has collections or is the last user or last admin?
    @user.destroy
    flash[:notice] = 'User was deleted.'
    redirect_to :action => :index
  end

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
