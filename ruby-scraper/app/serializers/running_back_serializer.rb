class RunningBackSerializer < ActiveModel::Serializer
  attributes :name, :team, :position, :status, :opp, :week, :comp_att, :pass_yds, :pass_td, :int, :rush_att, :rush_yds, :rush_td, :rec, :rec_yds, :rec_td, :tar, :two_pc, :fuml, :misc_td, :points
end
