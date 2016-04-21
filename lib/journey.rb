class Journey

  attr_reader :entry, :exit, :complete
  alias :complete? :complete

  def initialize(entry)
    @entry = entry
    @exit = nil
    @complete = false
  end

  def finish(exit)
    @exit = exit
    @complete = true
  end

end
