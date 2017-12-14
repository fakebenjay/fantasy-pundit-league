require 'open-uri'

def score(position, name, week)
  position_dir = {
    "qb" => 0,
    "rb" => 2,
    "wr" => 4,
    "te" => 6,
    "dst" => 16,
    "k" => 17,
    "flex" => 23
  }

  raw_html = open("http://games.espn.com/ffl/leaders?&avail=-1&search=#{name}&scoringPeriodId=#{week}&seasonId=2017&slotCategoryId=#{position_dir[position]}")
  raw_src = Nokogiri::HTML(raw_html)
  table = raw_src.css('.pncPlayerRow')

  if position_dir[position] == 16
    return table[0].css('.playertableStat')[7].text.to_f
  elsif position_dir[position] == 17
    return table[0].css('.playertableStat')[5].text.to_f
  else
    return table[0].css('.playertableStat')[14].text.to_f
  end
end

Dir.foreach('db/lineups').each do |file|
  next if file == '.' || file == '..'

  json = ActiveSupport::JSON.decode(File.read("db/lineups/#{file}"))
  week_num = file.gsub('week', '').gsub('.json', '').to_i

  json.each do |week|
    week.each do |name, roster|
      roster.each do |quality, lineup|
        team = Team.new(
          name: name,
          search_name: name.downcase.gsub('.', ''),
          week: week_num,
          quality: quality,
          qb_name: lineup['qb'],
          qb_points: score('qb', lineup['qb'].downcase, week_num),
          rb1_name: lineup['rb1'],
          rb1_points: score('rb', lineup['rb1'].downcase, week_num),
          rb2_name: lineup['rb2'],
          rb2_points: score('rb', lineup['rb2'].downcase, week_num),
          wr1_name: lineup['wr1'],
          wr1_points: score('wr', lineup['wr1'].downcase, week_num),
          wr2_name: lineup['wr2'],
          wr2_points: score('wr', lineup['wr2'].downcase, week_num),
          te_name: lineup['te'],
          te_points: score('te', lineup['te'].downcase, week_num),
          flex_name: lineup['flex'],
          flex_points: score('flex', lineup['flex'].downcase, week_num),
          dst_name: lineup['dst'],
          dst_points: score('dst', lineup['dst'].downcase, week_num),
          k_name: lineup['k'],
          k_points: score('k', lineup['k'].downcase, week_num),
        )

        team.total_points = team.qb_points + team.rb1_points + team.rb2_points + team.wr1_points + team.wr2_points + team.te_points + team.flex_points + team.dst_points + team.k_points
        team.total_points = team.total_points.round(1)
        print team.name
        print team.week
        puts team.quality
        team.save
      end
    end
  end
end
