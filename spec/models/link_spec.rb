require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }

  it 'validates that the url is a valid url' do
    link = Link.new(title: "Something", url: "bla")
    link.save
    expect(link.errors.messages[:url]).to eq(["is not a valid URL"])
  end
end
