module HomesHelper
	def error_message_on(object, method)
     return unless object.respond_to?(:errors) && object.errors.include?(method)
     errors = field_errors(object, method).join(', ')
	end

   private

   def field_errors(object, method)
     object.errors[method]
   end
end
