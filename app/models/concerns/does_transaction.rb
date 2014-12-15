module DoesTransaction
  as_trait do

    # Macros
    # belongs_to :category

    # validates :currency_code, presence: true, 
    #   inclusion: { in: CURRENCY_CODES }
  
    # Class method
    def self.my_class_method
      'My class method'
    end

    # Instance method
    def my_instance_method
      'My instance method'
    end

  end
end 


# class User < ActiveRecord::Base
#   include IsHuman, HasAddress
# end

# module IsHuman
#   as_trait do

#     validates :first_name, :last_name, presence: true

#     def full_name
#       "#{first_name} #{last_name}"
#     end

#   end
# end 

# module HasAddress
#   as_trait do

#     has_one :address

#   end
# end