class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :hobbies
        
# attr_accessible :email, :password, :password_confirmation, :remember_me, :username
# def user_params
#       params.require(:user).permit(:username, :email, :password, :password_confirmation, :remember_me)
#     end
	#has_one :contact
	validates :username, presence: true
	validates :mobile, presence: true
	validates :mobile, length: { is: 10 }, if: :mobile?
	validates :mobile, numericality: { only_integer: true }, if: :mobile?
	validates :mobile, uniqueness: true, if: :mobile?
	validates :address, presence: true

	has_attached_file :avatar, styles: 
														{ medium: "300x300>", 
															 thumb: "100x100>",
															square: "200x200" }
										#:url  => "/assets/images/:id/:style/:basename.:extension" ,
  									#:path => ":rails-club/public/assets/images/:id/:style/:basename.:extension"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  	validates_attachment_size :avatar, :less_than => 5.megabytes
end
