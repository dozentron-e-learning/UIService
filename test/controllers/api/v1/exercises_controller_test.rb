require 'test_helper'

class Api::V1::ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_exercise = api_v1_exercises(:one)
  end

  test "should get index" do
    get api_v1_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_exercise_url
    assert_response :success
  end

  test "should create api_v1_exercise" do
    assert_difference('Api::V1::Exercise.count') do
      post api_v1_exercises_url, params: { api_v1_exercise: { deadline: @api_v1_exercise.deadline, description: @api_v1_exercise.description, do_plagiarism_check: @api_v1_exercise.do_plagiarism_check, exercise_hidden_test: @api_v1_exercise.exercise_hidden_test, exercise_stub: @api_v1_exercise.exercise_stub, exercise_test: @api_v1_exercise.exercise_test, title: @api_v1_exercise.title, visible_date: @api_v1_exercise.visible_date } }
    end

    assert_redirected_to api_v1_exercise_url(Api::V1::Exercise.last)
  end

  test "should show api_v1_exercise" do
    get api_v1_exercise_url(@api_v1_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_exercise_url(@api_v1_exercise)
    assert_response :success
  end

  test "should update api_v1_exercise" do
    patch api_v1_exercise_url(@api_v1_exercise), params: { api_v1_exercise: { deadline: @api_v1_exercise.deadline, description: @api_v1_exercise.description, do_plagiarism_check: @api_v1_exercise.do_plagiarism_check, exercise_hidden_test: @api_v1_exercise.exercise_hidden_test, exercise_stub: @api_v1_exercise.exercise_stub, exercise_test: @api_v1_exercise.exercise_test, title: @api_v1_exercise.title, visible_date: @api_v1_exercise.visible_date } }
    assert_redirected_to api_v1_exercise_url(@api_v1_exercise)
  end

  test "should destroy api_v1_exercise" do
    assert_difference('Api::V1::Exercise.count', -1) do
      delete api_v1_exercise_url(@api_v1_exercise)
    end

    assert_redirected_to api_v1_exercises_url
  end
end
