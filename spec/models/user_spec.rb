require 'rails_helper'

RSpec.describe User, type: :model do
    describe "Validations" do
        it "is valid with valid attributes" do
          user = User.new(name: "Kaichi Momose", email: "kaichi@test.com", password: "1234")
          expect(user).to be_valid
        end

        it "is invalid without a name" do
          bad_user = User.new(name: nil, email: "kaichi@mail.com", password: "1234")
          expect(bad_user).to_not be_valid
        end

        it "is invalid without an email" do
          bad_user = User.new(name: "Kaichi Momose", email: nil, password: "1234")
          expect(bad_user).to_not be_valid
        end

        it "is invalid without a password" do
          bad_user = User.new(name: "Kaichi Momose", email: "kaichi@mail.com", password: nil)
          expect(bad_user).to_not be_valid
        end
    end

    describe "Associations" do
        it "should have many kudos" do
            assoc = User.reflect_on_association(:kudos)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many experiences" do
            assoc = User.reflect_on_association(:experiences)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many attendances" do
            assoc = User.reflect_on_association(:attendances)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many attend_experiences" do
            assoc = User.reflect_on_association(:attend_experiences)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many active_relationships" do
            assoc = User.reflect_on_association(:active_relationships)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many following" do
            assoc = User.reflect_on_association(:following)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many passive_relationships" do
            assoc = User.reflect_on_association(:passive_relationships)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many followers" do
            assoc = User.reflect_on_association(:followers)
            expect(assoc.macro).to eq :has_many
        end

        it "should have many get_kudos" do
            assoc = User.reflect_on_association(:given_kudos)
            expect(assoc.macro).to eq :has_many
        end
    end
end
