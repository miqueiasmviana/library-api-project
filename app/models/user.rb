# frozen_string_literal: true

class User < ActiveRecord::Base
  
  has_many :reviews
  has_many :games, through: :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end