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
    class_name == 'Human' ? 'humans' : self.class_name.tableize
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
# Class Person
  # belongs_to :house,
  #   foreign_key: :house_id,
  #   primary_key: :id,
  #   class_name: 'House'

  # Class House
  # has_many :persons,
  #   foreign_key: :house_id,
  #   primary_key: :id,
  #   class_name: 'Person'

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      f_k = options.send(:foreign_key)
      p_k = options.send(:primary_key)
      results = options.model_class.where(p_k => self.send(f_k))
      results.first
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa.
    # Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
