class User < ApplicationRecord
  has_many :comments

  validates :account, presence: true, 
                      uniqueness: true,
                      length: { minimum: 5}
  validates :password, presence: true, 
                      confirmation: true, 
                      length: { minimum: 5}
  validates :email, presence: true
  validates :nickname, presence: true

  before_create :encrypt_password

  def self.login(u)
    pw = Digest::SHA1.hexdigest("a#{u[:password]}z")
    User.find_by(account: u[:account], password: pw)
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end
end
