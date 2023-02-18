class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_later_to "quotes" } # broadcast_prepend_to
  # after_update_commit -> { broadcast_replace_later_to "quotes" } # broadcast_replace_to
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # Similar Functionality
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
