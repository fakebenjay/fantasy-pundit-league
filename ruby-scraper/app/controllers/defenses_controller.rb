class DefensesController < ApplicationController
  def new
    if !Defense.find_by(search_name: params['name'].downcase, week: params['week'])
      @defense = Defense.new

      raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{params['name']}&slotCategoryId=16&scoringPeriodId=#{params['week']}&seasonId=2017")
      raw_src = Nokogiri::HTML(raw_html)
      table = raw_src.css('.pncPlayerRow')

      @defense.name = table[0].css('.flexpop')[0].text
      @defense.search_name = @defense.name.downcase.gsub('.', '')
      @defense.position = "D/ST"
      @defense.status = table[0].css('.gameStatusDiv').text
      @defense.opp = table[0].css('.flexpop')[1].text
      @defense.week = params['week'].to_i
      @defense.td = table[0].css('.playertableStat')[0].text.to_f
      @defense.int = table[0].css('.playertableStat')[1].text.to_f
      @defense.fr = table[0].css('.playertableStat')[2].text.to_f
      @defense.sck = table[0].css('.playertableStat')[3].text.to_f
      @defense.sfty = table[0].css('.playertableStat')[4].text.to_f
      @defense.blk = table[0].css('.playertableStat')[5].text.to_f
      @defense.pa = table[0].css('.playertableStat')[6].text.to_f
      @defense.points = table[0].css('.playertableStat')[7].text.to_f

      @defense.save
      render json: @defense, serializer: DefenseSerializer
    else
      @defense = Defense.find_by(search_name: params['name'].downcase, week: params['week'])
      render json: @defense, serializer: DefenseSerializer
    end
  end
end
