require 'test_helper'

class CompletedTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @completed_task = completed_tasks(:one)
  end

  test "should get index" do
    get completed_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_completed_task_url
    assert_response :success
  end

  test "should create completed_task" do
    assert_difference('CompletedTask.count') do
      post completed_tasks_url, params: { completed_task: { content: @completed_task.content, due_date: @completed_task.due_date, priority_integer: @completed_task.priority_integer, user_id: @completed_task.user_id } }
    end

    assert_redirected_to completed_task_url(CompletedTask.last)
  end

  test "should show completed_task" do
    get completed_task_url(@completed_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_completed_task_url(@completed_task)
    assert_response :success
  end

  test "should update completed_task" do
    patch completed_task_url(@completed_task), params: { completed_task: { content: @completed_task.content, due_date: @completed_task.due_date, priority_integer: @completed_task.priority_integer, user_id: @completed_task.user_id } }
    assert_redirected_to completed_task_url(@completed_task)
  end

  test "should destroy completed_task" do
    assert_difference('CompletedTask.count', -1) do
      delete completed_task_url(@completed_task)
    end

    assert_redirected_to completed_tasks_url
  end
end
