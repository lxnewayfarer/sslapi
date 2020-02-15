class Domain < ApplicationRecord
    validates :domain, uniqueness: true, presence: true
end
