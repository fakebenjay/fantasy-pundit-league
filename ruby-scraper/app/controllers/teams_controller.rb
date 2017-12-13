class TeamsController < ApplicationController
  def show
    @team = Team.find_by(search_name: params['name'].downcase, week: params['week'], quality: params['quality'])
    render json: @team, serializer: TeamSerializer
  end
end
