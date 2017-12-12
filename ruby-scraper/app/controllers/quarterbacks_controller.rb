class QuarterbacksController < ApplicationController
  def new
    if !Quarterback.find_by(search_name: params['name'].downcase, week: params['week'])
      @quarterback = Quarterback.new

      raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{params['name']}&slotCategoryId=0&scoringPeriodId=#{params['week']}&seasonId=2017")
      raw_src = Nokogiri::HTML(raw_html)
      table = raw_src.css('.pncPlayerRow')

      @quarterback.name = table[0].css('.flexpop')[0].text
      @quarterback.search_name = @quarterback.name.downcase
      @quarterback.team = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0]
      @quarterback.position = "QB"
      @quarterback.status = table[0].css('.gameStatusDiv').text
      @quarterback.opp = table[0].css('.flexpop')[2].text
      @quarterback.week = params['week'].to_i
      @quarterback.comp_att = table[0].css('.playertableStat')[0].text
      @quarterback.pass_yds = table[0].css('.playertableStat')[1].text.to_f
      @quarterback.pass_td = table[0].css('.playertableStat')[2].text.to_f
      @quarterback.int = table[0].css('.playertableStat')[3].text.to_f
      @quarterback.rush_att = table[0].css('.playertableStat')[4].text.to_f
      @quarterback.rush_yds = table[0].css('.playertableStat')[5].text.to_f
      @quarterback.rush_td = table[0].css('.playertableStat')[6].text.to_f
      @quarterback.rec = table[0].css('.playertableStat')[7].text.to_f
      @quarterback.rec_yds = table[0].css('.playertableStat')[8].text.to_f
      @quarterback.rec_td = table[0].css('.playertableStat')[9].text.to_f
      @quarterback.tar = table[0].css('.playertableStat')[10].text.to_f
      @quarterback.two_pc = table[0].css('.playertableStat')[11].text.to_f
      @quarterback.fuml = table[0].css('.playertableStat')[12].text.to_f
      @quarterback.misc_td = table[0].css('.playertableStat')[13].text.to_f
      @quarterback.points = table[0].css('.playertableStat')[14].text.to_f

      @quarterback.save
      render json: @quarterback, serializer: QuarterbackSerializer
    else
      @quarterback = Quarterback.find_by(search_name: params['name'].downcase, week: params['week'])
      render json: @quarterback, serializer: QuarterbackSerializer
    end
  end
end
