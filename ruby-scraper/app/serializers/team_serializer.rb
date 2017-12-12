class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :search_name, :week, :qb_name, :qb_score, :rb1_name, :rb1_score, :rb2_name, :rb2_score, :wr1_name, :wr1_score, :wr2_name, :wr2_score, :te_name, :te_score, :flex_name, :flex_score, :dst_name, :dst_score, :k_name, :k_score, :total_points
end
