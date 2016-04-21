class Journey
  PENALTY = 6
  MINIMUM_FARE = 1

  attr_reader :entry_station, :exit_station, :complete
  alias :complete? :complete

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
    @complete = false
  end

  def finish(exit_station)
    @exit_station = exit_station
    @complete = true
  end

  def abnormal?
    !entry_station || !exit_station
  end

  def fare
    return MINIMUM_FARE unless abnormal?
    PENALTY
  end

end

# charge penalty if @entry or @exit == nil
