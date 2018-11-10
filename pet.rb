class Pet
  MIN = 0
  MAX = 100
  STEP = 10

  attr_reader :health, :hungry, :happiness, :cleanliness

  def initialize
    self.health = 100
    self.happiness = 50
    self.hungry = 100
    self.cleanliness = 100
  end

  def feed
    self.hungry -= STEP
  end

  def clean
    self.cleanliness += STEP
  end

  def fun
    self.happiness += STEP
  end

  def heal
    self.health += STEP
  end

  def tear
    self.health -= STEP
    self.happiness -= STEP
    self.hungry += STEP
    self.cleanliness -= STEP
  end

  private

  def in_range(value)
    value = MIN if value < MIN
    value = MAX if value > MAX
    value
  end

  def health=(value)
    @health = in_range(value)
  end

  def hungry=(value)
    @hungry = in_range(value)
  end

  def happiness=(value)
    @happiness = in_range(value)
  end

  def cleanliness=(value)
    @cleanliness = in_range(value)
  end
end