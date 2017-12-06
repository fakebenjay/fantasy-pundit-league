class DefenseSerializer < ActiveModel::Serializer
  attributes :name, :position, :status, :opp, :week, :td, :int, :fr, :sck, :sfty, :blk, :pa, :points
end
