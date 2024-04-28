# frozen_string_literal: true

json.data do
  json.array! @tasks, partial: 'tasks/task', as: :task
end
