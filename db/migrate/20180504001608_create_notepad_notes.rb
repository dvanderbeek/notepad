class CreateNotepadNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notepad_notes do |t|
      t.text :body
      t.references :author, foreign_key: true
      t.references :notable, polymorphic: true

      t.timestamps
    end

    add_foreign_key :notepad_notes, :admin_users, column: :author_id, on_delete: :cascade
  end
end
