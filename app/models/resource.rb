class Resource < ActiveRecord::Base
  belongs_to :resourceful, :polymorphic => true
end
