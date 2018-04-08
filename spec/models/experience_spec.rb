require 'rails_helper'

RSpec.describe Experience, type: :model do

    let(:host) {
        User.new(name: "Kaichi Momose", email: "kaichi@test.com")
    }

    describe "Validations" do
        it "is valid with valid attributes" do
          experience = Experience.new(name: "Tsubakuro",
                                      genre: "Leisure",
                                      place: "Nagano",
                                      start_day:"2018/4/1",
                                      end_day: "2018/4/2",
                                      price: "5000",
                                      capacity: 4,
                                      user: host)
          expect(experience).to be_valid
        end

        it "is invalid without a name" do
          bad_experience = Experience.new(name: nil,
                                         genre: "Leisure",
                                         place: "Nagano",
                                         start_day:"2018/4/1",
                                         end_day: "2018/4/2",
                                         price: "5000",
                                         capacity: 4,
                                         user: host)
          expect(bad_experience).to_not be_valid
        end

        it "is invalid without a genre" do
            bad_experience = Experience.new(name: "Tsubakuro",
                                            genre: nil,
                                            place: "Nagano",
                                            start_day:"2018/4/1",
                                            end_day: "2018/4/2",
                                            price: "5000",
                                            capacity: 4,
                                            user: host)
            expect(bad_experience).to_not be_valid
        end

        it "is invalid without a place" do
            bad_experience = Experience.new(name: "Tsubakuro",
                                            genre: "Leisure",
                                            place: nil,
                                            start_day:"2018/4/1",
                                            end_day: "2018/4/2",
                                            price: "5000",
                                            capacity: 4,
                                            user: host)
            expect(bad_experience).to_not be_valid
        end

        it "is invalid without a start_day" do
            bad_experience = Experience.new(name: "Tsubakuro",
                                            genre: "Leisure",
                                            place: "Nagano",
                                            start_day:nil,
                                            end_day: "2018/4/2",
                                            price: "5000",
                                            capacity: 4,
                                            user: host)
            expect(bad_experience).to_not be_valid
        end

        it "is invalid without an end_day" do
            bad_experience = Experience.new(name: "Tsubakuro",
                                            genre: "Leisure",
                                            place: "Nagano",
                                            start_day:"2018/4/1",
                                            end_day: nil,
                                            price: "5000",
                                            capacity: 4,
                                            user: host)
            expect(bad_experience).to_not be_valid
        end

        it "is invalid without a price" do
            bad_experience = Experience.new(name: "Tsubakuro",
                                            genre: "Leisure",
                                            place: "Nagano",
                                            start_day:"2018/4/1",
                                            end_day: "2018/4/2",
                                            price: nil,
                                            capacity: 4,
                                            user: host)
            expect(bad_experience).to_not be_valid
        end

        it "is invalid without a capacity" do
            bad_experience = Experience.new(name: "Tsubakuro",
                                            genre: "Leisure",
                                            place: "Nagano",
                                            start_day:"2018/4/1",
                                            end_day: "2018/4/2",
                                            price: "5000",
                                            capacity: nil,
                                            user: host)
            expect(bad_experience).to_not be_valid
        end

        it "is invalid without a user" do
            bad_experience = Experience.new(name: "Tsubakuro",
                                            genre: "Leisure",
                                            place: "Nagano",
                                            start_day:"2018/4/1",
                                            end_day: "2018/4/2",
                                            price: "5000",
                                            capacity: 4,
                                            user: nil)
            expect(bad_experience).to_not be_valid
        end
    end

    describe "Associations" do
        it "should have many experiences" do
            assoc = Experience.reflect_on_association(:user)
            expect(assoc.macro).to eq :belongs_to
        end

        it "should have many attendances" do
            assoc = Experience.reflect_on_association(:attendances)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many guests" do
            assoc = Experience.reflect_on_association(:guests)
            expect(assoc.macro).to eq :has_many
        end
    end
end
