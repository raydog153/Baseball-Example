class ModelXmlBase
include ActiveModel::Validations
include ActiveModel::Conversion
extend ActiveModel::Naming

def initialize(attributes = {})
  attributes.each do |k, v|
    instance_variable_set("@#{k}", v)
  end
end

end