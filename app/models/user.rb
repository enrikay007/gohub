class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

   validates :fullname, presence: true, length: {maximum: 40}  
   validates :password,  :format => { :with => /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/,
   :message => "Password should contain at least 6 characters, one upper case, one lower case and one numeric." }, on: :create
	 validates :password,  :format => { :with => /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/,
   :message => "Password should contain at least 6 characters, one upper case, one lower case and one numeric." }, on: :update, allow_blank: true
   
    
  validates_date :date_of_birth, :before => lambda { 18.years.ago },
                         :before_message => "must be at least 18 years old", if: :validate_date_of_birth?

    def validate_date_of_birth?
     return false if provider == 'google_oauth2' || provider == 'facebook'
      true
    end

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

   has_many :gears

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
        user.skip_confirmation! unless user.confirmed?
      end
  end
end