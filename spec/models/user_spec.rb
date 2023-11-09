require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do 
    user = User.new(
      email: 'test@example.com',
      first_name: 'John',
      last_name: 'Doe',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(user).to be_valid
  end 
  
  it 'is not valid without an email' do 
    user = User.new(email: nil)
    expect(user).not_to be_valid
  end
  
  it 'is not valid without a first name' do
    user = User.new(first_name: nil)
    expect(user).not_to be_valid
  end
  
  it 'is not valid without a last name' do
    user = User.new(last_name: nil)
    expect(user).not_to be_valid
  end 
  
  it 'it is not valid without a password' do
    user = User.new(
      password: nil
    )
      expect(user).not_to be_valid
  end 
  
  it 'is not valid when password and password_confirmation do not match' do
    user = User.new(
      password: 'password',
      password_confirmation: 'different_password'
    )
    expect(user).not_to be_valid
  end 
  
  it 'is not valid with a non-unique email (case-insensitive)' do
    user1 = User.create(email: 'test@example.com')
    user2 = User.new(email: 'TEST@example.com')
    expect(user2).not_to be_valid
  end
  
  it 'is not valid with a password less than 8 characters' do
    user = User.new(
      email: 'test@example.com',
      first_name: 'John',
      last_name: 'Doe',
      password: 'short',
      password_confirmation: 'short'
    )
    expect(user).not_to be_valid
  end
  
  it 'authenticates a user with valid email and password' do
    user = create(:user, email: 'test@example.com', password: 'password')
    authenticated_user = User.authenticate_with_credentials('test@example.com', 'password')
    expect(authenticated_user).to eq(user)
  end
  
  it 'returns nil for an invalid email or password' do
    user = create(:user, email: 'test@example.com', password: 'password')
    authenticated_user = User.authenticate_with_credentials('invalid@example.com', 'password')
    expect(authenticated_user).to be_nil
  end
  
  describe '.authenticate_with_credentials' do
    let(:user) do
      User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
  
    it 'returns the user if authenticated' do
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
  
    it 'returns nil if email is not found' do
      authenticated_user = User.authenticate_with_credentials('wrong@example.com', 'password')
      expect(authenticated_user).to be_nil
    end
  
    it 'returns nil if password is incorrect' do
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrong_password')
      expect(authenticated_user).to be_nil
    end
  
    it 'returns nil if email has leading/trailing whitespaces' do
      authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password')
      expect(authenticated_user).to be_nil
    end
  
    it 'returns the user if email has different case' do
      authenticated_user = User.authenticate_with_credentials('TEST@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
  
  end 
  
