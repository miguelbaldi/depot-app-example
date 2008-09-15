class AddTestData < ActiveRecord::Migration
  def self.up
		Product.delete_all
		Product.create(:title => 'Pragmatic Version Control' ,
			:description =>
				%{<p>
					This book is a recipe-based approach to using Subversion that will
					get you up and running quickly--and correctly. All projects need
					version control: it's a foundational piece of any project' s
					infrastructure. Yet half of all project teams in the U.S. don't use
					any version control at all. Many others don't use it well, and end
					up experiencing time-consuming problems.
				</p>},
			:image_url => '/images/svn.jpg' ,
			:price => 28.50)
			
			Product.create(:title => 'Pragmatic Ruby' ,
			:description =>
				%{<p>
					This book is a tutorial and reference for the Ruby programming language. Use Ruby, and you will write better code, 						be more productive, and enjoy programming more. 
				</p>},
			:image_url => '/images/ruby.jpg' ,
			:price => 34.50)
			
			Product.create(:title => 'My Job Went to India' ,
			:description =>
				%{<p>					
          This book isn’t about India. It’s about you. You’ve already lost your job. You may still be drawing a paycheck, but the job you were hired to do no longer exists. Your company has changed, the technology has changed, the economy has changed, and the ways you can add value have changed. Have you adapted to these changes? Or are you at risk?
          You need to architect your career, and this book will show you how.
				</p>},
			:image_url => '/images/mjwti.jpg' ,
			:price => 19.95)
			
			Product.create(:title => 'Stripes' ,
			:description =>
				%{<p>					
          Tired of complicated Java web frameworks that just get in your way? Stripes is a lightweight, practical framework that lets you write lean and mean code without a bunch of XML configuration files. Stripes is designed to do a lot of the common work for you, while being flexible enough to adapt to your requirements. This book will show you how to use Stripes to its full potential, so that you can easily develop professional, full-featured web applications. As a bonus, you’ll also get expert advice from the creator of Stripes, Tim Fennell.
				</p>},
			:image_url => '/images/fdstr.jpg' ,
			:price => 19.95)
			# . . .
	end
	def self.down
		Product.delete_all
	end
end
