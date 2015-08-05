require 'pry'

def get_first_name_of_season_winner(data, season)
  winner = ''
  data[season].each do |contestant|
    winner = contestant["name"] if contestant["status"] == "Winner" 
  end
  winner.split[0]

end

def get_contestant_name(data, occupation)
  occupation_contestant = ''
  data.each do |season|
    season[1].each do |contestant|
      occupation_contestant = contestant if contestant["occupation"] == occupation
    end
  end
  occupation_contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season|
    season[1].each do |contestant|
      count += 1 if contestant["hometown"] == hometown
    end
  end
  count
end

def get_occupation(data, hometown)
  hometown_contestant = nil
  data.each do |season|
    season[1].each do |contestant|
      hometown_contestant ||= contestant if contestant["hometown"] == hometown
    end
  end
  hometown_contestant["occupation"]
end

def get_average_age_for_season(data, season)
  season_ages = []
  data[season].map { |contestant| season_ages << contestant["age"].to_f }

  ((season_ages.inject(0) {|sum, i|  sum + i }) / season_ages.length).round
end

