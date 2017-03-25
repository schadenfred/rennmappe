class CheckSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :range_low, :range_high,
    :internal_check, :measure_units, :required
end
