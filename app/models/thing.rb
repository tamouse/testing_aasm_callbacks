class Thing < ActiveRecord::Base
  include AASM

  aasm do
    state :sleeping, initial: true
    state :running

    event :crank do
      transitions from: :sleeping, to: :sleeping do
        guard { sleeping_guard }
        after { process_sleeping }
      end
      transitions from: :sleeping, to: :running do
        guard { running_guard }
        after { process_running }
      end
      transitions from: :running, to: :running do
        guard { running_guard }
        after { process_running }
      end
      transitions from: :running, to: :sleeping do
        guard { sleeping_guard }
        after { process_running }
      end
    end
  end

  def sleeping_guard
    true
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
