class Employee < ActiveRecord::Base
	validate :custom_validate_method

	def custom_validate_method
		unless first_name.present?
			errors.add(:first_name, " Please can't leave blank.... fill with your first name ")
		end	
	end

	<<-Doc
	def a_method_used_for_validation_purposes
    	errors[:base] << "This person is invalid because ..."
  	end
  	Doc

	#validates :first_name, presence: true
	validates :first_name, length: { minimum: 2 }, exclusion: { in: %w( sahu ) }, format: { with: /\A[a-zA-Z]+\z/, message: "Only allow characters..." }, unless: "first_name.blank?" 	
	validates :last_name, presence: true
	validates :last_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/, message: "Only allow characters..." }, unless: "last_name.blank?" 
	validates :designation, presence: true
	validates :email, presence: true, uniqueness: true
	validates :email, confirmation: true
	validates :date_of_birth, presence: true
	validates :gender, presence: true
	validates :phone_number, presence: true
	validates :phone_number, numericality: true, length: { in: 10..11 }, unless: "phone_number.blank?" 
	validates :address, presence: true
	validates :pin_code, presence: true
	validates :pin_code, numericality: true, length: { is: 6 }, unless: "pin_code.blank?"
	validates :terms_and_condition, presence: true 
	validates_associated :pictures
	
	has_many :pictures, :as => :imageable
end