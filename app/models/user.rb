class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  acts_as_messageable

  has_many :bookmarks

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

end
