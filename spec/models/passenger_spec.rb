require 'rails_helper'

RSpec.describe Passenger do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
  end
end
