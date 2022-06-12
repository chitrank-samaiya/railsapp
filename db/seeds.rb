# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

job_1 = Job.create!(title: "Lead Developer", description: "This is posted today", published_at: Time.now)
job_2 = Job.create!(title: "Senior Developer", description: "This is posted today", published_at: Time.now)

skill_1 = Skill.create!(name: 'ruby')
skill_2 = Skill.create!(name: 'java')

emp_1 = Employee.create!(name: 'ashok', email: 'ashok@example.com', experience: '6.2', skill_set_attributes: [{id: skill_1.id}, {id: skill_2.id}])
emp_2 = Employee.create!(name: 'alok', email: 'alok@example.com', experience: '6.5', skill_set_attributes: [{id: skill_1.id}, {id: skill_2.id}])

can_1 = Candidate.create!(name: 'abhinav', email: 'abhinav@example.com', experience: '4.2', skill_set_attributes: [{id: skill_1.id}, {id: skill_2.id}])
can_2 = Candidate.create!(name: 'abhishek', email: 'abhishek@example.com', experience: '5.2', skill_set_attributes: [{id: skill_1.id}, {id: skill_2.id}])

Interview.create!(candidate_id: can_1.id, employee_id: emp_1.id, job_id: job_1.id, round: "Round 1")
Interview.create!(candidate_id: can_1.id, employee_id: emp_1.id, job_id: job_1.id, round: "Round 2")
Interview.create!(candidate_id: can_1.id, employee_id: emp_1.id, job_id: job_1.id, round: "Round 3")

Interview.create!(candidate_id: can_2.id, employee_id: emp_2.id, job_id: job_2.id, round: "Round 1")
Interview.create!(candidate_id: can_2.id, employee_id: emp_2.id, job_id: job_2.id, round: "Round 2")
Interview.create!(candidate_id: can_2.id, employee_id: emp_2.id, job_id: job_2.id, round: "Round 3")