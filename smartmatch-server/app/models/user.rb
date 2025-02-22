class User < ActiveRecord::Base

        #sets password
        has_secure_password
        validates :username, presence: true
        validates :username, uniqueness: true

        #this user can have many followed users
        has_many :liked_users, foreign_key: :liker_id, class_name: "Match"
        has_many :liked, through: :liked_users
        
        #this users can also like many users
        has_many :liking_users, foreign_key: :liked_id, class_name: "Match"
        has_many :likers, through: :liking_users


         #this user can have many followed users
        has_many :disliked_users, foreign_key: :disliker_id, class_name: "Dislike"
        has_many :disliked, through: :disliked_users
        
        #this users can also like many users
        has_many :disliking_users, foreign_key: :disliked_id, class_name: "Dislike"
        has_many :dislikers, through: :disliking_users


    def update_user (attr)
        update(attr)
    end

    def delete_user (id)
        user = User.find(id)
        user.destroy
    end

    def self.most_popular
        self.all.order(:liked)
    end

    def matches
        binding.pry
    end
end