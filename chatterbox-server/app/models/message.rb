class Message < ActiveRecord::Base
    def self.all_ordered
        self.all.order(:created_at, :desc)
    end
end