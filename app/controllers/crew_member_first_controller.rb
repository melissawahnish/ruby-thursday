class CrewMemberFirstController < ApplicationController

	def new
    @crew_member = CrewMember.new
  end

  def edit
    @crew_member = CrewMember.find(params[:id])
    @starship = @crew_member.build_starship
  end

  def create
    @crew_member = CrewMember.new(crew_member_params)
    respond_to do |format|
      if @crew_member.save
        format.html { redirect_to edit_crew_member_first_path(@crew_member),
        notice: 'Crew Member created!  Now select or create a starship.' }
      else
        format.html { render :new }
        format.json { render json: @crew_member.errors, status:  
        :unprocessable_entity }
      end
    end
  end

  def update
    @crew_member = CrewMember.find(params[:id])
    respond_to do |format|
      if @crew_member.update(crew_member_params)
        @starship = @crew_member.starship
        format.html { redirect_to @starship, notice: 'Crew Member updated.' }
      else
        format.html { render :edit}
        format.json { render json: @crew_member.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def crew_member_params
      params.require(:crew_member).permit(:name,:division, :starship_id,
      starship_attributes: [:name, :id])
    end
end