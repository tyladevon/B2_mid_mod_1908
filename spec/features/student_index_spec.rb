require 'rails_helper'

RSpec.describe "Student Index" do
  it "can see each student" do
    student = Student.create({name: "Suzy",
                              cohort: "1908",
                              age: 23})
    instructor = Instructor.create({name: "Megan" })
    instructor_2 = Instructor.create({name: "Ian" })
    InstructorStudent.create({instructor: instructor, student: student})
    InstructorStudent.create({instructor: instructor_2, student: student})


    visit '/students'
    expect(page).to have_content("Suzy")
    expect(page).to have_content("1908")
    expect(page).to have_content("Megan")
    expect(page).to have_content("Ian")
  end
  
  it "can see each student" do
    student = Student.create({name: "Suzy",
                              cohort: "1908",
                              age: 23})
    instructor = Instructor.create({name: "Megan" })
    instructor_2 = Instructor.create({name: "Ian" })
    InstructorStudent.create({instructor: instructor, student: student})
    InstructorStudent.create({instructor: instructor_2, student: student})

    visit '/students'
    click_link "Megan"
    expect(current_path).to eq("/instructors/#{instructor.id}")

    expect(page).to have_content("Megan")
    expect(page).to have_content("Suzy")
    expect(page).to have_content(23)
  end
end
