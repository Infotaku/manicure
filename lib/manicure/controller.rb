module Manicure
  module Controller
    module SingleLineAction
      ActiveRecord::Relation.send :include, self

      SUPPORTED_METHODS = %w(
        update_attribute
        update_attributes
        delete
        destroy
      )

      # This module allows to use the following straight forwards update, delete and destroy methods :
      # - update_attribute(s)_by_*
      # - delete_by_*
      # - destroy_by_*
      # in order to update, delete or destroy record from an ActiveRecord::Relation based on column
      # value(s) in a single line of code.
      #
      # * can be any column name of the ActiveRecord model represented by the ActiveRecord::Relation
      def method_missing(method_id, *arguments, &block)

        if method_id =~ /^(.*)_by_(.*)$/ && $1.in?(SUPPORTED_METHODS)

          class_eval <<-METHOD, __FILE__, __LINE__ + 1

            def #{method_id}(value, *args)                             # def delete_by_name(value, *args)
              unless (data = self.find_by_#{$2}(value)).nil?           #   unless (data = self.find_by_name(value)).nil?
                data.#{$1}(*args)                                      #     data.delete(*args)
                                                                       #
                data                                                   #     data
              end                                                      #   end
            end                                                        # end

          METHOD

          send(method_id, *arguments)
        else
          super
        end
      end
    end
  end
end