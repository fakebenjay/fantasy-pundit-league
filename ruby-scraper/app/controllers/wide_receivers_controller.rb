class WideReceiversController < ApplicationController
  def new
    @wide_receiver = WideReceiver.new

    raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{params['name']}&slotCategoryId=4&scoringPeriodId=#{params['week']}&seasonId=2017")
    raw_src = Nokogiri::HTML(raw_html)
    table = raw_src.css('.pncPlayerRow')

    @wide_receiver.name = table[0].css('.flexpop')[0].text
    @wide_receiver.team = table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0]
    @wide_receiver.position = "WR"
    @wide_receiver.status = table[0].css('.gameStatusDiv').text
    @wide_receiver.opp = table[0].css('.flexpop')[2].text
    @wide_receiver.week = params['week'].to_i
    @wide_receiver.comp_att = table[0].css('.playertableStat')[0].text
    @wide_receiver.pass_yds = table[0].css('.playertableStat')[1].text.to_f
    @wide_receiver.pass_td = table[0].css('.playertableStat')[2].text.to_f
    @wide_receiver.int = table[0].css('.playertableStat')[3].text.to_f
    @wide_receiver.rush_att = table[0].css('.playertableStat')[4].text.to_f
    @wide_receiver.rush_yds = table[0].css('.playertableStat')[5].text.to_f
    @wide_receiver.rush_td = table[0].css('.playertableStat')[6].text.to_f
    @wide_receiver.rec = table[0].css('.playertableStat')[7].text.to_f
    @wide_receiver.rec_yds = table[0].css('.playertableStat')[8].text.to_f
    @wide_receiver.rec_td = table[0].css('.playertableStat')[9].text.to_f
    @wide_receiver.tar = table[0].css('.playertableStat')[10].text.to_f
    @wide_receiver.two_pc = table[0].css('.playertableStat')[11].text.to_f
    @wide_receiver.fuml = table[0].css('.playertableStat')[12].text.to_f
    @wide_receiver.misc_td = table[0].css('.playertableStat')[13].text.to_f
    @wide_receiver.points = table[0].css('.playertableStat')[14].text.to_f

    render json: @wide_receiver, serializer: WideReceiverSerializer
  end
end
