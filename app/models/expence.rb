class Expence < ActiveRecord::Base

  belongs_to :user
  validates_presence_of :category
  validates_format_of :currency, :with => /^[A-Z]{0,3}$/, :message => "must be a currenncy code"
  validates_numericality_of :amount
  validates_numericality_of :longditude
  validates_numericality_of :latitude
  validates_presence_of :amount

end
