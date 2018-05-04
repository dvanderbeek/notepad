class CreateNotepadNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notepad_notes do |t|
      t.string :body
      t.references :author, foreign_key: true
      t.references :notable, polymorphic: true

      t.timestamps
    end
  end
end
