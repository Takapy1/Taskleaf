class Task < ApplicationRecord
  before_validation :set_nameless_name
  belongs_to :user, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }

  validates :name,
    presence: true,
    length: { maximum: 30 }
  validate :validates_name_not_including_comma
  # validates :description,
  #   presence: true

  private
  # 自作validationの練習
  def validates_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません。') if name&.include?(',')
  end
  # コールバック
  def set_nameless_name
    self.name = "名前なし" if name.blank?
  end
end
