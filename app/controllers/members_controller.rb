class MembersController < ApplicationController
  def index
    @q = Member.ransack(params[:q])
    @members = @q.result(:distinct => true).includes(:user, :team).page(params[:page]).per(10)

    render("members/index.html.erb")
  end

  def show
    @member = Member.find(params[:id])

    render("members/show.html.erb")
  end

  def new
    @member = Member.new

    render("members/new.html.erb")
  end

  def create
    @member = Member.new

    @member.team_id = params[:team_id]
    @member.user_id = params[:user_id]

    save_status = @member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/members/new", "/create_member"
        redirect_to("/members")
      else
        redirect_back(:fallback_location => "/", :notice => "Team joined successfully.")
      end
    else
      render("members/new.html.erb")
    end
  end

  def edit
    @member = Member.find(params[:id])

    render("members/edit.html.erb")
  end

  def update
    @member = Member.find(params[:id])

    @member.team_id = params[:team_id]
    @member.user_id = params[:user_id]

    save_status = @member.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/members/#{@member.id}/edit", "/update_member"
        redirect_to("/members/#{@member.id}", :notice => "Team updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Team updated successfully.")
      end
    else
      render("members/edit.html.erb")
    end
  end

  def destroy
    @member = Member.find(params[:id])

    @member.destroy

    if URI(request.referer).path == "/members/#{@member.id}"
      redirect_to("/", :notice => "Quit team successfully.")
    else
      redirect_back(:fallback_location => "/", :notice => "Quit team successfully.")
    end
  end
end
