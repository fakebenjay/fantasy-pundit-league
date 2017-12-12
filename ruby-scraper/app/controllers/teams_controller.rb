class TeamsController < ApplicationController
  def new
    @team = Team.new

    @team.name = name
    @team.search_name = @team.name.downcase
    @team.team = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0]
    @team.position = "QB"
    @team.status = table[0].css('.gameStatusDiv').text
    @team.opp = table[0].css('.flexpop')[2].text
    @team.week = params['week'].to_i
    @team.comp_att = table[0].css('.playertableStat')[0].text
    @team.pass_yds = table[0].css('.playertableStat')[1].text.to_f
    @team.pass_td = table[0].css('.playertableStat')[2].text.to_f
    @team.int = table[0].css('.playertableStat')[3].text.to_f
    @team.rush_att = table[0].css('.playertableStat')[4].text.to_f
    @team.rush_yds = table[0].css('.playertableStat')[5].text.to_f
    @team.rush_td = table[0].css('.playertableStat')[6].text.to_f
    @team.rec = table[0].css('.playertableStat')[7].text.to_f
    @team.rec_yds = table[0].css('.playertableStat')[8].text.to_f
    @team.rec_td = table[0].css('.playertableStat')[9].text.to_f
    @team.tar = table[0].css('.playertableStat')[10].text.to_f
    @team.two_pc = table[0].css('.playertableStat')[11].text.to_f
    @team.fuml = table[0].css('.playertableStat')[12].text.to_f
    @team.misc_td = table[0].css('.playertableStat')[13].text.to_f
    @team.points = table[0].css('.playertableStat')[14].text.to_f

    @team.save
  end

  def show
    @team = Team.find_by(search_name: params['name'].downcase, week: params['week'])
    render json: @team, serializer: TeamSerializer
  end
end
