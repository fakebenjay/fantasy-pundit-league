class KickersController < ApplicationController
  def new
    if !Kicker.find_by(search_name: params['name'].downcase, week: params['week'])
      @kicker = Kicker.new

      raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{params['name']}&slotCategoryId=17&scoringPeriodId=#{params['week']}&seasonId=2017")
      raw_src = Nokogiri::HTML(raw_html)
      table = raw_src.css('.pncPlayerRow')

      @kicker.name = table[0].css('.flexpop')[0].text
      @kicker.search_name = @kicker.name.downcase
      @kicker.team = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0]
      @kicker.position = "K"
      @kicker.status = table[0].css('.gameStatusDiv').text
      @kicker.opp = table[0].css('.flexpop')[2].text
      @kicker.week = params['week'].to_i
      @kicker.thirty = table[0].css('.playertableStat')[0].text
      @kicker.forty = table[0].css('.playertableStat')[1].text
      @kicker.fifty = table[0].css('.playertableStat')[2].text
      @kicker.fg = table[0].css('.playertableStat')[3].text
      @kicker.xp = table[0].css('.playertableStat')[4].text
      @kicker.points = table[0].css('.playertableStat')[5].text.to_f

      @kicker.save
      render json: @kicker, serializer: KickerSerializer
    else
      @kicker = Kicker.find_by(search_name: params['name'].downcase, week: params['week'])
      render json: @kicker, serializer: KickerSerializer
    end
  end
end
