require 'test_helper'

module Notepad
  class NotesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @note = notepad_notes(:one)
    end

    test "should get index" do
      get notes_url
      assert_response :success
    end

    test "should get new" do
      get new_note_url
      assert_response :success
    end

    test "should create note" do
      assert_difference('Note.count') do
        post notes_url, params: { note: { author_id: @note.author_id, body: @note.body, notable_id: @note.notable_id, notable_type: @note.notable_type } }
      end

      assert_redirected_to note_url(Note.last)
    end

    test "should show note" do
      get note_url(@note)
      assert_response :success
    end

    test "should get edit" do
      get edit_note_url(@note)
      assert_response :success
    end

    test "should update note" do
      patch note_url(@note), params: { note: { author_id: @note.author_id, body: @note.body, notable_id: @note.notable_id, notable_type: @note.notable_type } }
      assert_redirected_to note_url(@note)
    end

    test "should destroy note" do
      assert_difference('Note.count', -1) do
        delete note_url(@note)
      end

      assert_redirected_to notes_url
    end
  end
end
