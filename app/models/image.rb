class Image < ActiveRecord::Base
	validates :link, :format => URI::regexp(%w(http https))
	acts_as_taggable # Alias for acts_as_taggable_on :tags
end
