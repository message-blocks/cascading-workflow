module ReservationFlow
  def self.included(klass)
    klass.send :include, Workflow
    klass.send(:workflow) do
      state :authoring do
        event :lock, transitions_to: :locked
      end

      state :locked do
        event :validated, transitions_to: :reserved
        event :validated, transitions_to: :authoring
      end

      state :reserved do
        event :accepted, transitions_to: :completed
        event :rejected, transitions_to: :authoring
      end

      state :completed
    end
  end

  def load_workflow_state
    self[:workflow_state]
  end

  def persist_workflow_state(new_value)
    self[:workflow_state] = new_value
    save(validate: false)
  end
end
