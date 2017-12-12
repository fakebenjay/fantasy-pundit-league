class TightEndsController < ApplicationController
  def new
    if !TightEnd.find_by(search_name: params['name'].downcase, week: params['week'])
      @tight_end = TightEnd.new

      raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{params['name']}&slotCategoryId=6&scoringPeriodId=#{params['week']}&seasonId=2017")
      raw_src = Nokogiri::HTML(raw_html)
      table = raw_src.css('.pncPlayerRow')

      @tight_end.name = table[0].css('.flexpop')[0].text
      @tight_end.search_name = @tight_end.name.downcase
      @tight_end.team = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0]
      @tight_end.position = "TE"
      @tight_end.status = table[0].css('.gameStatusDiv').text
      @tight_end.opp = table[0].css('.flexpop')[2].text
      @tight_end.week = params['week'].to_i
      @tight_end.comp_att = table[0].css('.playertableStat')[0].text
      @tight_end.pass_yds = table[0].css('.playertableStat')[1].text.to_f
      @tight_end.pass_td = table[0].css('.playertableStat')[2].text.to_f
      @tight_end.int = table[0].css('.playertableStat')[3].text.to_f
      @tight_end.rush_att = table[0].css('.playertableStat')[4].text.to_f
      @tight_end.rush_yds = table[0].css('.playertableStat')[5].text.to_f
      @tight_end.rush_td = table[0].css('.playertableStat')[6].text.to_f
      @tight_end.rec = table[0].css('.playertableStat')[7].text.to_f
      @tight_end.rec_yds = table[0].css('.playertableStat')[8].text.to_f
      @tight_end.rec_td = table[0].css('.playertableStat')[9].text.to_f
      @tight_end.tar = table[0].css('.playertableStat')[10].text.to_f
      @tight_end.two_pc = table[0].css('.playertableStat')[11].text.to_f
      @tight_end.fuml = table[0].css('.playertableStat')[12].text.to_f
      @tight_end.misc_td = table[0].css('.playertableStat')[13].text.to_f
      @tight_end.points = table[0].css('.playertableStat')[14].text.to_f

      @tight_end.save
      render json: @tight_end, serializer: TightEndSerializer
    else
      @tight_end = TightEnd.find_by(search_name: params['name'].downcase, week: params['week'])
      render json: @tight_end, serializer: TightEndSerializer
    end
  end
end
