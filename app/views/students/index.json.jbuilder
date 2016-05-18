json.array!(@students) do |student|
  json.extract! student, :id, :id, :status, :name, :register_number
  json.url student_url(student, format: :json)
end
