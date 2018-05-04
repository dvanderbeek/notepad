require "application_system_test_case"

module Notepad
  class NotesTest < ApplicationSystemTestCase
    setup do
      @note = notepad_notes(:one)
    end

    test "visiting the index" do
      visit notes_url
      assert_selector "h1", text: "Notes"
    end

    test "creating a Note" do
      visit notes_url
      click_on "New Note"

      fill_in "Author", with: @note.author_id
      fill_in "Body", with: @note.body
      fill_in "Notable", with: @note.notable_id
      fill_in "Notable Type", with: @note.notable_type
      click_on "Create Note"

      assert_text "Note was successfully created"
      click_on "Back"
    end

    test "updating a Note" do
      visit notes_url
      click_on "Edit", match: :first

      fill_in "Author", with: @note.author_id
      fill_in "Body", with: @note.body
      fill_in "Notable", with: @note.notable_id
      fill_in "Notable Type", with: @note.notable_type
      click_on "Update Note"

      assert_text "Note was successfully updated"
      click_on "Back"
    end

    test "destroying a Note" do
      visit notes_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Note was successfully destroyed"
    end
  end
end
