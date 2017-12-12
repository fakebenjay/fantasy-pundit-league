class KickerSerializer < ActiveModel::Serializer
  attributes :name, :search_name, :team, :position, :status, :opp, :week, :thirty, :forty, :fifty, :fg, :xp, :points
end
