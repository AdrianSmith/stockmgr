class PeopleSkillsController < ApplicationController
  
  # GET /people_skills
  # GET /people_skills.xml
  def index
    @people_skills = PeopleSkill.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people_skills }
    end
  end

  # GET /people_skills/1
  # GET /people_skills/1.xml
  def show
    @people_skill = PeopleSkill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @people_skill }
    end
  end

  # GET /people_skills/new
  # GET /people_skills/new.xml
  def new
    @people_skill = PeopleSkill.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @people_skill }
    end
  end

  # GET /people_skills/1/edit
  def edit
    @people_skill = PeopleSkill.find(params[:id])
  end

  # POST /people_skills
  # POST /people_skills.xml
  def create
    @people_skill = PeopleSkill.new(params[:people_skill])

    respond_to do |format|
      if @people_skill.save
        flash[:notice] = 'PeopleSkill was successfully created.'
        format.html { redirect_to(@people_skill) }
        format.xml  { render :xml => @people_skill, :status => :created, :location => @people_skill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @people_skill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people_skills/1
  # PUT /people_skills/1.xml
  def update
    @people_skill = PeopleSkill.find(params[:id])

    respond_to do |format|
      if @people_skill.update_attributes(params[:people_skill])
        flash[:notice] = 'PeopleSkill was successfully updated.'
        format.html { redirect_to(@people_skill) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @people_skill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people_skills/1
  # DELETE /people_skills/1.xml
  def destroy
    @people_skill = PeopleSkill.find(params[:id])
    @people_skill.destroy

    respond_to do |format|
      format.html { redirect_to(people_skills_url) }
      format.xml  { head :ok }
    end
  end
end
