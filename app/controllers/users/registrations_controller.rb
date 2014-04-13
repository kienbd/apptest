class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def new
    super
    session[:redirect_url] = params[:redirect_url]
  end

  def create
    super
    if resource.save
	unless session[:redirect_url].nil?
		begin
		#	ip = request.env["REMOTE_ADDR"]
		#	uri = URI.parse("http://#{ip}:3000/dbticket")
		#	http = Net::HTTP.new(uri.host, uri.port)
		#	req = Net::HTTP::Post.new(uri.request_uri)
		#	args = {:email => resource.email}
		#	req.set_form_data( args )
		#	#response = http.request(req)
		rescue
			# TODO
		end
		case response
		when Net::HTTPSuccess, Net::HTTPRedirection
			# TODO response.body, response.head
		else
			# TODO
		end
	end
    end
  end
  
  def after_update_path_for(resource)
  end

  def after_sign_up_path_for(resource)
	path = session[:redirect_url]
	session[:redirect_url] = nil
	return path
  end

  def sign_up(resource_name, resource)
    true
  end
end
