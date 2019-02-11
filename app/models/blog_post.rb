# == Schema Information
#
# Table name: blog_posts
#
#  id            :integer          not null, primary key
#  name          :string
#  content       :text
#  feature_image :string
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :integer
#  published     :boolean          default(FALSE)
#  published_at  :datetime
#

class BlogPost < ApplicationRecord

  belongs_to :admin_user
  
  acts_as_taggable

  mount_uploader :feature_image, FeatureImageUploader

  searchkick 

  scope :search_import, -> { includes(:tags) }

  def search_data
    {
      name_tagged: "#{name} #{tags.map(&:name).join(" ")}",
      name: name,
      id: id,
      slug: slug
    }
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :published, -> { where(published: true) }

  def should_generate_new_friendly_id?
    name_changed?    
  end

  def display_day_published
    if published_at.nil?
      "Not published yet."
    else
      "Published #{published_at.strftime('%-b %-d, %Y')}"
    end
  end

  
end
