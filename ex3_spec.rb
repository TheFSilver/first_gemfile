# frozen_string_literal: true

require 'ex3.rb'

describe 'the trader du dimanche function' do
  it 'returns the best buying and selling days' do
    expect(trader_du_dimanche([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eql([1, 4])
  end
end
