 class Album < ApplicationRecord
    has_one_attached :cover_image
    has_many_attached :images
    belongs_to :user
    has_and_belongs_to_many :tags

    
    def tag_list
        tags.map(&:name).join(', ')
    end
    
      def tag_list=(names)
          self.tags = names.split(',').map do |n|
          Tag.where(name: n.strip).first_or_create!
        end
      end
  end
