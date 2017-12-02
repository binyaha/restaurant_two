class Catagory < ApplicationRecord
has_many :restaurants, dependent: :destroy
end
