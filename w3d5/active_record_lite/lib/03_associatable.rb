require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    self.foreign_key = "#{name}_id".to_sym
    self.primary_key = :id
    self.class_name = "#{name.to_s.camelcase}"

    options.each { |attr_name, val| send("#{attr_name}=", val) }
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    self.foreign_key = "#{self_class_name.to_s.underscore}_id".to_sym
    self.primary_key = :id
    self.class_name = "#{name.to_s.singularize.camelcase}"

    options.each { |attr_name, val| send("#{attr_name}=", val) }
  end
end

# Class Cat
  # belongs_to :person,
  #   foreign_key: :person_id,
  #   primary_key: :id,
  #   class_name: 'Person'

# Class Person
  # has_many :cats,
  #   foreign_key: :person_id,
  #   primary_key: :id,
  #   class_name: 'Cat'

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      f_k = options.foreign_key
      p_k = options.primary_key

      options.model_class.where(p_k => self.send(f_k)).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self, options)

    define_method(name) do
      f_k = options.foreign_key
      p_k = options.primary_key

      options.model_class.where(f_k => self.send(p_k))
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa.
    # Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
