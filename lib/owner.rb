require 'pry'
class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets

  @@owners = []
  @@count = 0

  def self.count
    @@count
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@count = 0
  end

  def initialize(species)
    @species = species
    @@owners << self
    @@count += 1
    @pets = { :fishes => [], :cats => [], :dogs => []}
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets.map do |k, v|
      if k == :dogs
        v.each do |k|
          k.mood = "happy"
        end
      end
    end
  end

  def play_with_cats
    @pets.map do |k, v|
      if k == :cats
        v.each do |k|
          k.mood = "happy"
        end
      end
    end
  end
  
  def feed_fish
    @pets.map do |k, v|
      if k == :fishes
        v.each do |k|
          k.mood = "happy"
        end
      end
    end
  end

  def sell_pets
    @pets.collect do |k, v|
      v.each do |animal|
        animal.mood = "nervous"
      end
      v.clear
    end
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end
end