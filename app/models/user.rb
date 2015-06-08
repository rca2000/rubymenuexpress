class User < ActiveRecord::Base
    attr_accessor :password
    
    email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    
    validates :name, :presence     => true,
              :length              => { :maximum => 100 }
    
    validates :email, :presence    => true,
              :format              => {:with => email_regex},
              :uniqueness          => { :case_sensitive => false}
    
    validates :password, :presence => true,
              :confirmation        => true,
              :length              => { :within => 6..20 }
    
    before_save :encrypt_password

    # Ruby on rails 4 ya no utiliza el attr_accessible ahora es el Strong Parameters
    #attr_accessible :name, :address, :district_id, :email, :estate, :password, :password_confirmation
    # Strong Parameters
    def user_params
        params.require(:user).permit(:name, :address, :district_id, :email, :estate, :password, :password_confirmation)
    end
    
    def has_password?(submitted_password)
        encrypted_password == encrypt(submitted_password)
    end

    #Chequea si el email y el password son válidos
    def self.authenticate(email, submitted_password)
        user = find_by_email(email)

        return nil if user.nil?
        return user if user.has_password?(submitted_password)
    end
    
    private
        def encrypt_password
            self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") if self.new_record?
            self.encrypted_password= encrypt(password)
        end
        
        def encrypt(pass)
            Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
        end
end
