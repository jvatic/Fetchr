module PagesHelper

  def resource_attributes(resource)
    resource.attrs.inject('') { |memo, (k,v)| memo << "k='#{v}' " }
  end

end
