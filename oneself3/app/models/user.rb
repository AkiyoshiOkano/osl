class User < ActiveRecord::Base

  has_many :microposts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         image:    auth.info.image,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def feed
    #このコードは準備段階です。
    #完全な実装は第11章「ユーザーをフォローする」を参照して下さい。
    microposts.where("user_id = ?" , id)
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end
end