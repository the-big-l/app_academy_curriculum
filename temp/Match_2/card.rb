class Card
  attr_reader :face_value, :face_down

  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
  end

  def display
    @face_down ? "X" : @face_value.to_s
  end

  def ==(card)
    @face_value == card.face_value
  end
end
