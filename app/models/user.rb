class User
  include MongoMapper::Document
  # Include default devise modules. Others available are:
  #  :recoverable, :rememberable, :trackable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  many :tasks
  
  key :name,                        String, required: true
  key :email,                       String
  key :encrypted_password,          String


end
