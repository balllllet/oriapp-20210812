class User < ApplicationRecord
   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :introduction 
    validates :birthday  

      with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
        validates :family_name
        validates :first_name      
      end

      with_options presence: true, format: {with: /\A[ァ-ヶー]+\z/} do
        validates :family_name_reading
        validates :first_name_reading
      end

  end    

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  has_many :items
  has_many :orders
  has_many :messages
  has_many :messages_seconds
  end
  
