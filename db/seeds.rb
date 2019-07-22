require 'faker'


10.times do 
    name = Faker::Name.unique.name
    email = (name.split.join + '@gmail.com')
    age = rand(18..50)
    company = Faker::Company.bs
    Interviewer.find_or_create_by(name: name,email: email, age: age, company: company)
end

10.times do 
    name = Faker::Name.unique.name
    email = (name.split.join + '@gmail.com')
    age = rand(18..50)
    Applicant.find_or_create_by(name: name,email: email, age: age)
end


