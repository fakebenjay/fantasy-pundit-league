require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry'

def round_week(week)
  week = week.to_i
  if week < 1
    week = 1
  elsif week > 17
    week = 17
  else
    week
  end
end

def find_player(position, name, week)
  position_dir = {
    "qb" => 0,
    "rb" => 2,
    "wr" => 4,
    "te" => 6,
    "dst" => 16,
    "k" => 17,
    "flex" => 23
  }

  fullname_dir = {
    "qb" => 'quarterbacks',
    "rb1" => 'runningbacks',
    "rb2" => 'runningbacks',
    "wr1" => 'widereceivers',
    "wr2" => 'widereceivers',
    "te" => 'tightends',
    "dst" => 'defenses',
    "k" => 'kickers',
    "flex" => 'flexes'
  }

  week = round_week(week)

  raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{name}&scoringPeriodId=#{week}&seasonId=2017&slotCategoryId=#{position_dir[position]}")
  raw_src = Nokogiri::HTML(raw_html)
  table = raw_src.css('.pncPlayerRow')

  if position_dir[position] == 16
    player = {
      name: table[0].css('.flexpop')[0].text,
      position: position,
      status: table[0].css('.gameStatusDiv').text,
      opp: table[0].css('.flexpop')[1].text,
      td: table[0].css('.playertableStat')[0].text.to_f,
      int: table[0].css('.playertableStat')[1].text.to_f,
      fr: table[0].css('.playertableStat')[2].text.to_f,
      sck: table[0].css('.playertableStat')[3].text.to_f,
      sfty: table[0].css('.playertableStat')[4].text.to_f,
      blk: table[0].css('.playertableStat')[5].text.to_f,
      pa: table[0].css('.playertableStat')[6].text.to_f,
      points: table[0].css('.playertableStat')[7].text.to_f
    }
  elsif position_dir[position] == 17
    player = {
      name: table[0].css('.flexpop')[0].text,
      team: table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0],
      position: position,
      status: table[0].css('.gameStatusDiv').text,
      opp: table[0].css('.flexpop')[2].text,
      thirty: table[0].css('.playertableStat')[0].text,
      forty: table[0].css('.playertableStat')[1].text,
      fifty: table[0].css('.playertableStat')[2].text,
      fg: table[0].css('.playertableStat')[3].text,
      xp: table[0].css('.playertableStat')[4].text,
      points: table[0].css('.playertableStat')[5].text.to_f
    }
  else
    player = {
      name: table[0].css('.flexpop')[0].text,
      team: table[0].css('.playertablePlayerName')[0].text.split(" ")[2].split(" ")[0],
      position: position,
      status: table[0].css('.gameStatusDiv').text,
      opp: table[0].css('.flexpop')[2].text,
      comp_att: table[0].css('.playertableStat')[0].text,
      pass_yds: table[0].css('.playertableStat')[1].text.to_f,
      pass_td: table[0].css('.playertableStat')[2].text.to_f,
      int: table[0].css('.playertableStat')[3].text.to_f,
      rush_att: table[0].css('.playertableStat')[4].text.to_f,
      rush_yds: table[0].css('.playertableStat')[5].text.to_f,
      rush_td: table[0].css('.playertableStat')[6].text.to_f,
      rec: table[0].css('.playertableStat')[7].text.to_f,
      rec_yds: table[0].css('.playertableStat')[8].text.to_f,
      rec_td: table[0].css('.playertableStat')[9].text.to_f,
      tar: table[0].css('.playertableStat')[10].text.to_f,
      two_pc: table[0].css('.playertableStat')[11].text.to_f,
      fuml: table[0].css('.playertableStat')[12].text.to_f,
      misc_td: table[0].css('.playertableStat')[13].text.to_f,
      points: table[0].css('.playertableStat')[14].text.to_f
    }
  end

  return player
end

def runner
  file = open("../js/lineups.json")
  json = file.read
  parsed = JSON.parse(json)

  parsed.each do |pundit|
    pundit.each do |k, v|
      if k == "name"
        pundit[k] = v
      else
        pundit[k].each do |lineup|
          binding.pry
        end
        # key = "#{k}_score"
        # binding.pry
        # pundit[key] = find_player(position, name, week)
      end
    end
  end
end

runner
