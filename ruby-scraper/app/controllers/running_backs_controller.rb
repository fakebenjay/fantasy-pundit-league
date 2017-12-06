class RunningBacksController < ApplicationController
  def new
    @running_back = RunningBack.new

    raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{params['name']}&slotCategoryId=2&scoringPeriodId=#{params['week']}&seasonId=2017")
    raw_src = Nokogiri::HTML(raw_html)
    table = raw_src.css('.pncPlayerRow')

    @running_back.name = table[0].css('.flexpop')[0].text
    @running_back.team = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0]
    @running_back.position = "RB"
    @running_back.status = table[0].css('.gameStatusDiv').text
    @running_back.opp = table[0].css('.flexpop')[2].text
    @running_back.week = params['week'].to_i
    @running_back.comp_att = table[0].css('.playertableStat')[0].text
    @running_back.pass_yds = table[0].css('.playertableStat')[1].text.to_f
    @running_back.pass_td = table[0].css('.playertableStat')[2].text.to_f
    @running_back.int = table[0].css('.playertableStat')[3].text.to_f
    @running_back.rush_att = table[0].css('.playertableStat')[4].text.to_f
    @running_back.rush_yds = table[0].css('.playertableStat')[5].text.to_f
    @running_back.rush_td = table[0].css('.playertableStat')[6].text.to_f
    @running_back.rec = table[0].css('.playertableStat')[7].text.to_f
    @running_back.rec_yds = table[0].css('.playertableStat')[8].text.to_f
    @running_back.rec_td = table[0].css('.playertableStat')[9].text.to_f
    @running_back.tar = table[0].css('.playertableStat')[10].text.to_f
    @running_back.two_pc = table[0].css('.playertableStat')[11].text.to_f
    @running_back.fuml = table[0].css('.playertableStat')[12].text.to_f
    @running_back.misc_td = table[0].css('.playertableStat')[13].text.to_f
    @running_back.points = table[0].css('.playertableStat')[14].text.to_f

    render json: @running_back, serializer: RunningBackSerializer
  end
end
