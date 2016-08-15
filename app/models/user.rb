class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :location
  accepts_nested_attributes_for :location
  validates :firstname, :lastname, :username, :role, presence: true

#------- Check if User is active before authenticating -------
  def active_for_authentication?
    super && self.account_active?
  end

  def account_active?
    unless(self.active == true)
      redirect_to new_session_path
    end
  end

  def inactive_message
    "Sorry, this account is inactive. Please contact a manager to reactivate your account."
  end

end
