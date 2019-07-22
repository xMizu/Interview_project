class Applicant < ApplicationRecord
    has_many :interviews
    has_many :interviewers, through: :interviews
    validates :email, uniqueness: true, presence: true
    validates :name, presence: true
end
