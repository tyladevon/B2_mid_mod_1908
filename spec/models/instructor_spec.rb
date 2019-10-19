require 'rails_helper'

describe Instructor, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :instructor_students}
    it {should have_many :students}
  end

  describe "instance methods" do
    describe "average age" do
      it "can average age of all students" do
        student = Student.create({name: "Suzy",
                                  cohort: "1908",
                                  age: 23})
        student_2 = Student.create({name: "Zadin",
                                  cohort: "1908",
                                  age: 21})
        instructor = Instructor.create({name: "Ian" })
        InstructorStudent.create({instructor: instructor, student: student})
        InstructorStudent.create({instructor: instructor, student: student_2})

        expect(instructor.average_age_all_students).to eq(22)
      end
    end
  end

end
