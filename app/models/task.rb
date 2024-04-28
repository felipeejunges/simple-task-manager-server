# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, presence: true
  validates_length_of :title, minimum: 1, allow_blank: false
end

# == Schema Information
#
# Table name: tasks
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
