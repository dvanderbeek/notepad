module Notepad
  class Note < ApplicationRecord
    belongs_to :author
    belongs_to :notable, polymorphic: true
  end
end
