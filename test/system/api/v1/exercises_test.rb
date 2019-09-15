require "application_system_test_case"

class Api::V1::ExercisesTest < ApplicationSystemTestCase
  setup do
    @api_v1_exercise = api_v1_exercises(:one)
  end

  test "visiting the index" do
    visit api_v1_exercises_url
    assert_selector "h1", text: "Api/V1/Exercises"
  end

  test "creating a Exercise" do
    visit api_v1_exercises_url
    click_on "New Api/V1/Exercise"

    fill_in "Deadline", with: @api_v1_exercise.deadline
    fill_in "Description", with: @api_v1_exercise.description
    check "Do plagiarism check" if @api_v1_exercise.do_plagiarism_check
    fill_in "Exercise hidden test", with: @api_v1_exercise.exercise_hidden_test
    fill_in "Exercise stub", with: @api_v1_exercise.exercise_stub
    fill_in "Exercise test", with: @api_v1_exercise.exercise_test
    fill_in "Title", with: @api_v1_exercise.title
    fill_in "Visible date", with: @api_v1_exercise.visible_date
    click_on "Create Exercise"

    assert_text "Exercise was successfully created"
    click_on "Back"
  end

  test "updating a Exercise" do
    visit api_v1_exercises_url
    click_on "Edit", match: :first

    fill_in "Deadline", with: @api_v1_exercise.deadline
    fill_in "Description", with: @api_v1_exercise.description
    check "Do plagiarism check" if @api_v1_exercise.do_plagiarism_check
    fill_in "Exercise hidden test", with: @api_v1_exercise.exercise_hidden_test
    fill_in "Exercise stub", with: @api_v1_exercise.exercise_stub
    fill_in "Exercise test", with: @api_v1_exercise.exercise_test
    fill_in "Title", with: @api_v1_exercise.title
    fill_in "Visible date", with: @api_v1_exercise.visible_date
    click_on "Update Exercise"

    assert_text "Exercise was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise" do
    visit api_v1_exercises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise was successfully destroyed"
  end
end
