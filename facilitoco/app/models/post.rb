# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
	belongs_to :user
=begin
	1- mostrar user_id == current_user.user_id
	2- mostrar las de mis amigos
		user_id -> amistad.friend_id
		user_id -> user.friend_id
		amistad aceptada
=end
	def self.all_for_user(user)
		Post.where(user_id: user.id)
			.or( Post.where(user_id: user.friend_ids))
			.or( Post.where(user_id: user.user_ids))
	end

end
