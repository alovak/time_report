module TimeReport::Duration
  def in_hours
    hours = duration / 60
    minutes = duration % 60

    "%02d:%02d" % [hours, minutes]
  end
end
