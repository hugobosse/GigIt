class Bar < ApplicationRecord
 validates :name, uniqueness: { scope: :city, message: "This bar already exists in this city" }
end
