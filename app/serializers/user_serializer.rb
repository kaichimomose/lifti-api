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
             :created_experience_count,
             :guest_image_file_url,
             :host_image_file_url

   def guest_image_file_url
       object.guest_image_file.url()
   end

   def host_image_file_url
       object.host_image_file.url()
   end
end
