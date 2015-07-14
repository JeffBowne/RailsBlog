class Profile < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :city, presence: true, length: { minimum: 2, maximum: 30 }
  
  before_create :nicefact # this is the hook, but where does it show up?

  def nicefact
    puts "You have a great day!"
  end
end
