require "rails_helper"

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: "My name", email: "email@email.com")
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end

RSpec.describe User, type: :model do
  before { described_class.create!(name: "My name", email: "email@email.com") }
  it "is invalid if the email is not unique" do
    expect(subject).to be_invalid
  end
end
