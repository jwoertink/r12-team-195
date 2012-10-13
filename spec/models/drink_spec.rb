require 'spec_helper'

describe Drink do
  it { should have_many(:ingredients) }
end
