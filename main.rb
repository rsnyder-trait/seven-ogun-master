require 'sinatra/simple-navigation'
require 'pony'
require 'rack-flash'
#require 'coffee-script'
require File.join(File.dirname(__FILE__),'lib','list_renderer.rb')
require File.join(File.dirname(__FILE__),'lib','contact_form.rb')

class Main < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::SimpleNavigation
  helpers Sinatra::Partials

  configure do
    # Configure public directory
    set :public, File.join(File.dirname(__FILE__), 'public')

    # Configure HAML and SASS
    set :haml, { :format => :html5 }
    set :sass, { :style => :compressed } if ENV['RACK_ENV'] == 'production'
  end

  get '/' do
    haml :index
  end

  get %r{\/(solutions|clients-and-partners)\/([\w-]+)} do
    @partial = params[:captures][1].gsub('-','_')
    haml :subsection
  end
  
  get '/about' do
    haml :about_us
  end

  get '/contact' do
    @form = ContactForm.new
    haml :contact
  end

  post '/contact' do
    @form = ContactForm.new(params[:contact])
    if @form.valid?
      if ENV['RACK_ENV'] == 'production'
        Pony.mail :to => 'fernanda@sevenogun.com, jmollica@traitstudio.com',
                  :from => @form.email,
                  :subject => 'Seven Ogun Contact Form',
                  :via => :smtp,
                  :via_options => {
                    :port => 25,
                    :user_name  => ENV['SENDGRID_USERNAME'],
                    :password   => ENV['SENDGRID_PASSWORD'],
                    :address   => 'smtp.sendgrid.net',
                    :authentication   => :plain,
                    :domain => ENV['SENDGRID_DOMAIN'] },
                  :body => erb(:email)
      end
      flash[:notice] = 'Thank you for contacting us. Someone will reply to your message shortly.'
      redirect '/contact'
    else
      haml :contact
    end
  end

  #get '/js/application.js' do
  #  coffee :'coffeescripts/application'
  #end

  get "/css/style.css" do
    content_type 'text/css'
    sass :"css/style"
  end

end
