class KickerSerializer < ActiveModel::Serializer
  attributes :name, :team, :position, :status, :opp, :week, :thirty, :forty, :fifty, :fg, :xp, :points
end
