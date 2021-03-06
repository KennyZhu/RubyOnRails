require 'spec_helper'

describe User do
	before do
		@user=User.new(name:"yanlong",email:"yanlongzhu2010@gmail.com") 
	end

	subject {@user}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	
	describe "when name is not present" do
		before {@user.name = " "}
                it {should_not be_valid}
	end
	describe "when email is not present" do
		before {@user.email = " "}
		it {should_not be_valid}
	end
	describe "when name is too long " do
		before {@user.name = "a"*51}
		it {should_not be_valid}
	end
	describe "when email address is already taken" do
	    before do 
		user_with_same_email = @user.dup
		user_with_same_email.save
	    end
	    it {should_not be_valid}
	end
end
