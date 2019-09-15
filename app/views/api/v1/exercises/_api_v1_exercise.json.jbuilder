json.extract! api_v1_exercise, :id, :title, :description, :deadline, :visible_date, :do_plagiarism_check, :exercise_test, :exercise_hidden_test, :exercise_stub, :created_at, :updated_at
json.url api_v1_exercise_url(api_v1_exercise, format: :json)
