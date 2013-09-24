require 'digest'
class User < ActiveRecord::Base
	# password est un attribut virtuel 
	# attribut virtuel est un attribut qui ne correspond pas
	# à une colonne de la base de données et cela en utilsant
	# attr_accessor => password virtuel
	attr_accessor :password
   


	# Rendre les attributs nom et email accessibles
	attr_accessible :nom, :email, :password, 
	                 :password_confirmation
	
	validates :nom, :presence => true, :length => {:maximum =>50}
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence     => true,
					   :format      => {:with => email_regex},
					   :uniqueness  => {:case_sensitive => false}

    validates :password, :presence    => true,
               :confirmation          => true,
               :length                => {:within =>6..40}
   before_save :encrypt_password

  def has_password?(password_soumis)
    encrypted_password == encrypt(password_soumis)
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end



end

