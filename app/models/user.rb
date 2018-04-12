class User < ApplicationRecord
    attribute :password, :string
    attribute :did_follow, :boolean
    attribute :followers_count, :integer
    attribute :following_count, :integer
    attribute :kudos_count, :integer
    attribute :attendances_count, :integer
    attribute :created_experience_count, :integer

    validates :name, :password, presence: true
    validates :email, presence: true, uniqueness: true

    has_attached_file :guest_image_file
    validates_attachment :guest_image_file, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/x-png', 'image/gif']}
    has_attached_file :host_image_file
    validates_attachment :host_image_file, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/x-png', 'image/gif']}

    before_save :encrypt_password
    before_create :generate_token

    has_many :experiences
    has_many :kudos

    has_many :given_kudos, class_name:  "Kudo",
                         foreign_key: "taker_id",
                         dependent:   :destroy

    has_many :attendances, class_name:  "Attendance",
                           foreign_key: "guest_id",
                           dependent:   :destroy
    has_many :attend_experiences, through: :attendances

    has_many :active_relationships, class_name:  "FollowHost",
                                    foreign_key: "follower_id",
                                    dependent:   :destroy
    has_many :following, through: :active_relationships, source: :followed

    has_many :passive_relationships, class_name:  "FollowHost",
                                     foreign_key: "followed_id",
                                     dependent:   :destroy
    has_many :followers, through: :passive_relationships, source: :follower

    # attend experience.
    def attend(experience)
        attend_experiences << experience
    end

    def cancel(experience)
        attend_experiences.delete(experience)
    end

    def follow(host)
        following << host
    end

    # Unfollows a user.
    def unfollow(host)
        following.delete(host)
    end

    # Returns true if the current user is following the other user.
    def following?(host)
        following.include?(host)
    end

    def followers_counter()
        followers.count
    end

    def following_counter()
        following.count
    end

    def kudos_counter()
        given_kudos.count
    end

    def attendances_counter()
        attend_experiences.count
    end

    def created_experience_counter()
        experiences.count
    end

    # Checks if a user is authenticated
    def self.authenticate(email, password)
      user = self.find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end

    # Salts and hashes a user's password
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end

    # Generates a token for a user
    def generate_token
      token_gen = SecureRandom.hex
      self.token = token_gen
      token_gen
    end
end
