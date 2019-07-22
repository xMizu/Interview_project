class Interviewer < ApplicationRecord
    has_many :interviews
    has_many :applicants, through: :interviews
    validates :email, uniqueness: true
end
