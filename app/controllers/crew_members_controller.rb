class CrewMembersController < ApplicationController

 # GET /crew_members/new
  def new
    @crew_member = CrewMember.new
    @starship = @crew_member.build_starship
    @holodeck_programs = @starship.holodeck_programs.build
  end

 # POST /crew_members
 # POST /crew_members.json
  def create
    @crew_member = CrewMember.new(crew_member_params)
    respond_to do |format|
      if @crew_member.save
        @starship = @crew_member.starship
        format.html { redirect_to @starship,
        notice: 'Crew Member was successfully created.' }
        format.json { render :show, status: :created, location: @starship }
      else
        format.html { render :new }
        format.json { render json: @crew_member.errors, status:  
        :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def crew_member_params
      params.require(:crew_member).permit(:name,:division, :starship_id,
      starship_attributes: [:name, :id, holodeck_programs_attributes:
      [:title, :starship_id, :crew_member_id]])
    end
end