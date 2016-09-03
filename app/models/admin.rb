class Admin < ActiveRecord::Base
  belongs_to :location
  accepts_nested_attributes_for :location

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, :username, presence: true
  validates :read_active, inclusion: [true]

  protected

  # skip email confirmation - only used for development
  # erase the method below when ready to deploy to production
  def confirmation_required?
    false
  end

end
