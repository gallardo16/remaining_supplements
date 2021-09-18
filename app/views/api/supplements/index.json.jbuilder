# frozen_string_literal: true

json.array! @supplements do |supplement|
  json.extract! supplement, :id, :name, :supplement_type, :content_size, :daily_intake, :remind, :created_at, :updated_at
end
