require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe("User Model") do

    before(:each) do 
      @user = User.new({
        first_name:"Dave",
        last_name:"Davidson",
        password:"password",
        password_confirmation:"password",
        email:"dave@dave.com"
      })
    end
  
    it "should successfully store the user" do
      if @user.save
        bool = true
      end
      expect(bool).to be(true)
    end
  
    it "should throw an error because passwords don't match" do
      @user.save
      @user2 = User.new({
        first_name:"Dave",
        last_name:"Davidson",
        password:"password",
        password_confirmation:"",
        email:"dave@dave.com"
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "should throw an error because first name is nil" do
      @user2 = User.new({
        last_name:"bobberton",
        password:"password",
        password_confirmation:"password",
        email:"Dave@dave.com"
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("First name can't be blank")
    end
    
    it "should throw an error because last name is nil" do
      @user2 = User.new({
        first_name:"bob",
        password:"password",
        password_confirmation:"password",
        email:"Dave@dave.com"
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "should throw an error because email is nil" do
      @user2 = User.new({
        first_name:"bob",
        last_name:"bobberton",
        password:"password",
        password_confirmation:"password",
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("Email can't be blank")
    end
    
    it "should enforce minimum password length of 6 characters" do
      @user2 = User.new({email:"bob@bob.com",
      first_name:"bob",
      last_name:"bobberton",
      password:"pass",
      password_confirmation:"pass"})
      @user2.save
      expect(@user2.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  
    it "should throw an error if email already exists in db" do
      @user.save
      @user2 = User.new({
        first_name:"bob",
        last_name:"bobberton",
        password:"password",
        password_confirmation:"password",
        email:"dave@dave.com"
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "should allow user to login regardless of upper or lower case email" do
      @user.save
      if @user.authenticate_with_credentials("dave@DAVE.com", "password")
        success = true
      end
      expect(success).to be(true)
    end

    it "should allow user to log in successfully even if leading or trailing spaces are used for the email" do
      @user.save
      if @user.authenticate_with_credentials("  dave@dave.com  ", "password")
        success = true
      end
      expect(success).to be(true)
    end

  end
end