module ActiveRecordExtensions
  extend ActiveSupport::Concern

  module ClassMethods

    # Override 'to_param'.
    def custom_slugs_with(seed)
      self.redefine_method(:to_param) do
        [id, self.send(seed).parameterize].join("-")
      end
    end

  end

  # Include above methods in all models.
  ActiveRecord::Base.send(:include, ActiveRecordExtensions)

end