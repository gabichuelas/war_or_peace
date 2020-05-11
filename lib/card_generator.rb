require 'csv'

class CardGenerator
  def initialize(file)
    @file = file
  end

  def cards
    # if I do headers: false, doesn't organize
    # file into a table...also the following
    # does not work
    # array = CSV.parse(File.read(@file), headers: false)
    # fixed_table = []
    # array.each do |ary|
    #   ary[0].to_sym
    #   ary[2].to_i
    #   fixed_table << ary
    # end
  end
end

cards = CardGenerator.new("cards.txt").cards
p cards
