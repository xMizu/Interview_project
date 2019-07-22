require 'test_helper'

class InterviewersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interviewers_index_url
    assert_response :success
  end

  test "should get show" do
    get interviewers_show_url
    assert_response :success
  end

  test "should get new" do
    get interviewers_new_url
    assert_response :success
  end

  test "should get edit" do
    get interviewers_edit_url
    assert_response :success
  end

  test "should get create_interview" do
    get interviewers_create_interview_url
    assert_response :success
  end

end
