class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  has_many :todos

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource provided, it overrides existing user
    # to prevent identity being locked with accidentally created accounts.
    # Note: may leave zombie accounts (with no associated identity) which
    # can be cleaned up later.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get existing user by email if provider supplies verified email.
      # If no verified email provided, assign a temporary email and ask user
      # to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: autho.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
  


end
