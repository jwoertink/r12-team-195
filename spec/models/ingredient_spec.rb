require 'spec_helper'

describe Ingredient do
  it { should belong_to(:drink) }
end
