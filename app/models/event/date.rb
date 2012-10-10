# == Schema Information
#
# Table name: event_dates
#
#  id        :integer          not null, primary key
#  event_id  :integer          not null
#  label     :string(255)
#  start_at  :datetime
#  finish_at :datetime
#

class Event::Date < ActiveRecord::Base
  
  attr_accessible :label, :start_at, :finish_at
  attr_accessor :start_at_date, :start_at_time, :finish_at_date, :finish_at_time
  
  belongs_to :event

  # TODO: fix this, commented out because of event unit specs
  #before_validation :merge_start_at, :merge_finish_at

  private
  def merge_start_at
    @start_at = merge_date_time(start_at_date, start_at_time)
  end

  def merge_finish_at
    @finish_at = merge_date_time(finish_at_date, finish_at_time)
  end

  def merge_date_time(d,t)
    if t.present?
      DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    else
      DateTime.new(d.year, d.month, d.day)
    end
  end

  def to_s
    name = "#{start_at} - #{finish_at}"
    label? ? "#{label}: #{name}" : name
  end
  
end