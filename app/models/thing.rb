class Thing < ActiveRecord::Base
  include AASM

  aasm do
    state :sleeping, initial: true
    state :running

    event :run do
      transitions from: :sleeping, to: :running do
        guard { running_guard }
        after { process_running }
      end
      transitions from: :sleeping, to: :sleeping do
        after { process_sleeping }
      end
    end
  end

  def running_guard
    true
  end

  def process_running
    "blah"
  end

  def process_sleeping
    "zzzzz"
  end

end
