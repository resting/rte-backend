class Post < ApplicationRecord
    def self.reversed
        order('created_at DESC')
    end
end
