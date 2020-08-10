require "application_system_test_case"

class CompletedTasksTest < ApplicationSystemTestCase
  setup do
    @completed_task = completed_tasks(:one)
  end

  test "visiting the index" do
    visit completed_tasks_url
    assert_selector "h1", text: "Completed Tasks"
  end

  test "creating a Completed task" do
    visit completed_tasks_url
    click_on "New Completed Task"

    fill_in "Content", with: @completed_task.content
    fill_in "Due date", with: @completed_task.due_date
    fill_in "Priority integer", with: @completed_task.priority_integer
    fill_in "User", with: @completed_task.user_id
    click_on "Create Completed task"

    assert_text "Completed task was successfully created"
    click_on "Back"
  end

  test "updating a Completed task" do
    visit completed_tasks_url
    click_on "Edit", match: :first

    fill_in "Content", with: @completed_task.content
    fill_in "Due date", with: @completed_task.due_date
    fill_in "Priority integer", with: @completed_task.priority_integer
    fill_in "User", with: @completed_task.user_id
    click_on "Update Completed task"

    assert_text "Completed task was successfully updated"
    click_on "Back"
  end

  test "destroying a Completed task" do
    visit completed_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Completed task was successfully destroyed"
  end
end
