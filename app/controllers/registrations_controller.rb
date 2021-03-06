class RegistrationsController < ApplicationController
  before_action :current_user_must_be_registration_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_registration_user
    registration = Registration.find(params[:id])

    unless current_user == registration.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Registration.ransack(params[:q])
    @registrations = @q.result(:distinct => true).includes(:user, :session).page(params[:page]).per(10)

    render("registrations/index.html.erb")
  end

  def show
    @registration = Registration.find(params[:id])

    render("registrations/show.html.erb")
  end

  def new
    @registration = Registration.new

    render("registrations/new.html.erb")
  end

  def create
    @registration = Registration.new

    @registration.user_id = params[:user_id]
    @registration.session_id = params[:session_id]

    save_status = @registration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/registrations/new", "/create_registration"
        redirect_to("/registrations")
      else
        redirect_back(:fallback_location => "/", :notice => "Registration created successfully.")
      end
    else
      render("registrations/new.html.erb")
    end
  end

  def edit
    @registration = Registration.find(params[:id])

    render("registrations/edit.html.erb")
  end

  def update
    @registration = Registration.find(params[:id])
    @registration.session_id = params[:session_id]

    save_status = @registration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/registrations/#{@registration.id}/edit", "/update_registration"
        redirect_to("/registrations/#{@registration.id}", :notice => "Registration updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Registration updated successfully.")
      end
    else
      render("registrations/edit.html.erb")
    end
  end

  def destroy
    @registration = Registration.find(params[:id])

    @registration.destroy

    if URI(request.referer).path == "/registrations/#{@registration.id}"
      redirect_to("/", :notice => "Registration deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Registration deleted.")
    end
  end
end
