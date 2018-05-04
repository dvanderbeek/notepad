module Notepad
  class Note < ApplicationRecord
    belongs_to :author, class_name: "AdminUser"
    belongs_to :notable, polymorphic: true
  end
end
