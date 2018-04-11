class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email,
             :bio,
             :title,
             :host,
             :did_follow,
             :followers_count,
             :following_count,
             :kudos_count,
             :attendances_count,
             :created_experience_count
end
