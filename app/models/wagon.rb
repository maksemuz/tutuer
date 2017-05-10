class Wagon < ApplicationRecord
  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }, presence: true

  before_save :assign_number

  # scope :coupe, -> { where(type:'Coupe') }
  # scope :platzkart, -> { where(type:'Platzkart') }
  # scope :comfort, -> { where(type:'Comfort') }
  # scope :sitting, -> { where(type:'Sitting') }
  scope :sorted_fwd, -> { order(number: :asc) }
  scope :sorted_back, -> { order(number: :desc) }

  scope :wagon_kind, ->(kind) { where(type: kind) }

  def assign_number
    self.number ||= train.wagons.maximum(:number).to_i + 1
  end
end
