require 'rails_helper'

RSpec.describe Kudo, type: :model do

    let(:host) {
        User.new(name: "Kaichi Momose", email: "kaichi@test.com")
    }

    describe "Validations" do
        it "is valid with valid attributes" do
          kudo = Kudo.new(comments: "Tsubakuro",
                          taker_id: 1,
                          user: host)
          expect(kudo).to be_valid
        end

        it "is invalid without comments" do
          bad_kudo = Kudo.new(comments: nil,
                              taker_id: 1,
                              user: host)
          expect(bad_kudo).to_not be_valid
        end

        it "is invalid without a taker_id" do
            bad_kudo = Kudo.new(comments: "test",
                                taker_id: nil,
                                user: host)
            expect(bad_kudo).to_not be_valid
        end

        it "is invalid without a user" do
            bad_kudo = Kudo.new(comments: "test",
                                taker_id: 1,
                                user: nil)
            expect(bad_kudo).to_not be_valid
        end
    end

    describe "Associations" do
        it "should have many kudos" do
            assoc = Kudo.reflect_on_association(:user)
            expect(assoc.macro).to eq :belongs_to
        end
    end

end
