class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :projects
end
