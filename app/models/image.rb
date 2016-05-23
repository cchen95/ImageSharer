class Image < ActiveRecord::Base
	validates :link, :format => URI::regexp(%w(http https))
end
