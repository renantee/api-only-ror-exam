require "rails_helper"

RSpec.describe Post, type: :model do
  before do
    @user = User.new(name: "My name", email: "email@email.com")
  end
  subject do
    described_class.new(title:   "Post title",
                        content: "Post content",
                        user:    @user)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end
end
