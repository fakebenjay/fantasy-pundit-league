class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :search_name, :week, :qb_name, :qb_points, :rb1_name, :rb1_points, :rb2_name, :rb2_points, :wr1_name, :wr1_points, :wr2_name, :wr2_points, :te_name, :te_points, :flex_name, :flex_points, :dst_name, :dst_points, :k_name, :k_points, :total_points
end
