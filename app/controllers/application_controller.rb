class ApplicationController < ActionController::Base
  def resource_params # action_args + cancancan
    permitting_model_name = self.class.instance_variable_defined?(:@permitting_model_name) && self.class.instance_variable_get(:@permitting_model_name)
    model = (permitting_model_name || self.class.name.sub(/.+::/, '').sub(/Controller$/, '')).singularize.underscore.tr('/', '_').to_sym
    attrs = self.class.instance_variable_get(:@permitted_attributes)
    params.require(model).permit attrs
  end
end
