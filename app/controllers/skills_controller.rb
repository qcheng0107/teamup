class SkillsController < ApplicationController
  def index
    @skills = Skill.all

    render("skills/index.html.erb")
  end

  def show
    @skill = Skill.find(params[:id])

    render("skills/show.html.erb")
  end

  def new
    @skill = Skill.new

    render("skills/new.html.erb")
  end

  def create
    @skill = Skill.new

    @skill.user_id = params[:user_id]
    @skill.skill = params[:skill]

    save_status = @skill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/skills/new", "/create_skill"
        redirect_to("/skills")
      else
        redirect_back(:fallback_location => "/", :notice => "Skill created successfully.")
      end
    else
      render("skills/new.html.erb")
    end
  end

  def edit
    @skill = Skill.find(params[:id])

    render("skills/edit.html.erb")
  end

  def update
    @skill = Skill.find(params[:id])

    @skill.user_id = params[:user_id]
    @skill.skill = params[:skill]

    save_status = @skill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/skills/#{@skill.id}/edit", "/update_skill"
        redirect_to("/skills/#{@skill.id}", :notice => "Skill updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Skill updated successfully.")
      end
    else
      render("skills/edit.html.erb")
    end
  end

  def destroy
    @skill = Skill.find(params[:id])

    @skill.destroy

    if URI(request.referer).path == "/skills/#{@skill.id}"
      redirect_to("/", :notice => "Skill deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Skill deleted.")
    end
  end
end
