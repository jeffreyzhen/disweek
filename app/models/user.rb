class User < ActiveRecord::Base
  has_many :identities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
            :omniauthable, :omniauth_providers => [:instagram]

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.password = Devise.friendly_token[0,20]
       user.nickname = auth.info.nickname
       user.pic = auth.info.image
     end
   end
end
