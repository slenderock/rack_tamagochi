class Pet
  MIN = 0
  MAX = 100
  STEP = 20

  attr_reader :happiness, :hunger, :sleepiness, :health
  attr_accessor :event

  def initialize
    self.event = :idle
    self.health = MAX
    self.happiness = MAX / 2
    self.hunger = MAX
    self.sleepiness = MAX
  end

  def idle
    self.event = :idle
  end

  def play
    self.event = :play
    self.happiness += STEP
    self.hunger -= STEP
    self.sleepiness -= STEP
  end

  def feed
    self.event = :feed
    self.hunger += STEP
  end

  def rest
    self.event = :rest
    self.sleepiness += STEP
  end

  def dead?
    health.zero?
  end

  def mood
    case health
    when 0..33
      :sad
    when 34..66
      :worried
    else
      :happy
    end
  end

  def stats
    {
      health: health,
      hunger: hunger,
      happiness: happiness,
      sleepiness: sleepiness,
      mood: mood,
      event: event,
      dead: dead?
    }
  end

  def in_range(value)
    if value <= MIN
      value = MIN
      yield if block_given?
    end

    value = MAX if value > MAX
    value
  end

  def health=(value)
    @health = in_range(value)
  end

  def hunger=(value)
    @hunger = in_range(value, &method(:decrease_health))
  end

  def happiness=(value)
    @happiness = in_range(value, &method(:decrease_health))
  end

  def sleepiness=(value)
    @sleepiness = in_range(value, &method(:decrease_health))
  end

  def decrease_health
    self.health -= STEP
  end
end