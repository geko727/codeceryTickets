class User < ActiveRecord::Base
	has_secure_password validations: false
	has_many :tickets
	has_many :comments
end
