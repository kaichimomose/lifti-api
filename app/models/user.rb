class User < ApplicationRecord
    has_many :experiences

    has_many :attendances, class_name:  "Attendance",
                           foreign_key: "guest_id",
                           dependent:   :destroy
    has_many :attend_experiences, through: :attendances

    has_many :relationships, class_name:  "FollowHost",
                             foreign_key: "follower_id",
                             dependent:   :destroy
    has_many :following, through: :relationships, source: :followed

    has_many :active_relationships_as_guest, class_name:  "KudosToHost",
                                             foreign_key: "guest_id",
                                             dependent:   :destroy
    has_many :gave_kudos_as_guest, through: :active_relationships_as_guest, source: :host

    has_many :passive_relationships_as_guest, class_name:  "KudosToHost",
                                              foreign_key: "host_id",
                                              dependent:   :destroy
    has_many :given_kudos_as_host, through: :passive_relationships_as_guest, source: :guest

    has_many :active_relationships_as_host, class_name:  "KudosToGuest",
                                            foreign_key: "host_id",
                                            dependent:   :destroy
    has_many :gave_kudos_as_host, through: :active_relationships_as_host, source: :guest

    has_many :passive_relationships_as_host, class_name:  "KudosToGuest",
                                             foreign_key: "guest_id",
                                             dependent:   :destroy
    has_many :given_kudos_as_guest, through: :passive_relationships_as_host, source: :host

    # attend experience.
    def attend(experience)
        attend_experiences << experience
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

    def give_kudos_to_host(host)
        gave_kudos_as_guest << host
    end

    def unkudos_to_host(host)
        gave_kudos_as_guest.delete(host)
    end

    def give_kudos_to_guest(guest)
        gave_kudos_as_host << guest
    end

    def unkudos_to_guest(guest)
        gave_kudos_as_host.delete(guest)
    end
end
