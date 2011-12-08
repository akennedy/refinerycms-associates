require 'spec_helper'

describe Associate do

  def reset_associate(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @associate.destroy! if @associate
    @associate = Associate.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_associate
  end

  context "validations" do
    
    it "rejects empty name" do
      Associate.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_associate
      Associate.new(@valid_attributes).should_not be_valid
    end
    
  end

end