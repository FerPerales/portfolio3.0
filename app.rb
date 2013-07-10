require 'sinatra'
require 'haml'
require 'pony'

enable :sessions

# Routes

['/', '/index'].each do |path|
	get path do
		@title = 'FerPerales :: Home'
		haml :index
	end
end

get '/resume' do
	@title = 'FerPerales :: Resume'
	haml :resume
end

get '/portfolio' do
	@title = 'FerPerales :: Portfolio'
	haml :portfolio
end

get '/cv' do

	increase_counter
	file_path = get_cv_file
	send_file file_path, :disposition => 'attachment'
end

get '/presentations' do
	@title = 'FerPerales :: Presentations'
	haml :presentations
end

get '/blog' do
	@title = 'FerPerales :: Blog'
	haml :blog
end

get '/contact' do
	@title = 'FerPerales :: Contact'
	haml :contact
end

post '/contact' do
	Pony.mail(
		:from    => params[:name] + '<' + params[:email] + '>',
		:to      => 'fer.perales.montoya@gmail.com',
		:subject => params[:name] + ' <' + params[:email] + '> contacted you: ' + params[:subject],
		:body    => params[:message],
		:port    => '587',
		:via     => :smtp,
    :via_options => {
			:address              => 'smtp.gmail.com',
			:port                 => '587',
			:enable_starttls_auto => true,
			:user_name            => ENV['EMAIL'],
			:password             => ENV['PASSWORD'],
			:authentication       => :plain,
			:domain               => 'gmail.com'
    }
  )
	session[:mail_confirmation] = "Thanks! I'll mail you back in less than 24 hours"
  redirect '/contact'
end

not_found do
	@title = 'Not found'
	haml :not_found
end

# Helpers

helpers do

	def cv_downloads
		counter_file_path = File.join 'public', 'count.txt'
		counter_file = File.open counter_file_path do |file|
			counter = file.gets.to_i
			file.close
			counter
		end
	"<i class='icon-download'></i> <small><span class='download-count'>#{counter_file}</span> #{pluralize('time', counter_file)}</small>"
	end

	def pluralize(base_string, n)
		base_string += (n != 1 ? 's' : '')
	end

	def display_email_notice
		message = session[:mail_confirmation]
		if message
			session[:mail_confirmation] = nil
			"<div class='alert alert-success'>
			<button type='button' class='close' data-dismiss='alert'>&times;</button>
			#{message}
			</div>"
		end
	end

end

:private

def increase_counter
	counter_file_path = File.join 'public', 'count.txt'
	counter_file = File.open(counter_file_path, "r+") do |file|
	  num = file.gets.to_i || 0
	  file.rewind
	  file.puts num.next
	end
end

def get_cv_file
	File.join('public', 'docs', 'CV Fernando Perales_en.pdf')
end