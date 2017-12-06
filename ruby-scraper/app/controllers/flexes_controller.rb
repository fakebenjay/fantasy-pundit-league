class FlexesController < ApplicationController
  def new
    @flex = Flex.new

    raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{params['name']}&slotCategoryId=23&scoringPeriodId=#{params['week']}&seasonId=2017")
    raw_src = Nokogiri::HTML(raw_html)
    table = raw_src.css('.pncPlayerRow')

    @flex.name = table[0].css('.flexpop')[0].text
    @flex.team = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0]
    @flex.position = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[1]
    @flex.status = table[0].css('.gameStatusDiv').text
    @flex.opp = table[0].css('.flexpop')[2].text
    @flex.week = params['week'].to_i
    @flex.comp_att = table[0].css('.playertableStat')[0].text
    @flex.pass_yds = table[0].css('.playertableStat')[1].text.to_f
    @flex.pass_td = table[0].css('.playertableStat')[2].text.to_f
    @flex.int = table[0].css('.playertableStat')[3].text.to_f
    @flex.rush_att = table[0].css('.playertableStat')[4].text.to_f
    @flex.rush_yds = table[0].css('.playertableStat')[5].text.to_f
    @flex.rush_td = table[0].css('.playertableStat')[6].text.to_f
    @flex.rec = table[0].css('.playertableStat')[7].text.to_f
    @flex.rec_yds = table[0].css('.playertableStat')[8].text.to_f
    @flex.rec_td = table[0].css('.playertableStat')[9].text.to_f
    @flex.tar = table[0].css('.playertableStat')[10].text.to_f
    @flex.two_pc = table[0].css('.playertableStat')[11].text.to_f
    @flex.fuml = table[0].css('.playertableStat')[12].text.to_f
    @flex.misc_td = table[0].css('.playertableStat')[13].text.to_f
    @flex.points = table[0].css('.playertableStat')[14].text.to_f

    render json: @flex, serializer: FlexSerializer
  end
end
