class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :location
  accepts_nested_attributes_for :location
  validates :firstname, :lastname, :username, :role, presence: true
  validates :active, inclusion: [true, false]

#------- Check if User is active before authenticating -------
  def active_for_authentication?
    super && active?
  end

  def inactive_message
    "Sorry, this account is inactive. Please contact the admin or a manager to reactivate your account."
  end

end
