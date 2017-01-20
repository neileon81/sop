class Publish < Thor
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  desc "website", "publish the website"
  def website
    puts "publishing the website"
    
    #==================================
    # update repositories
    #==================================
    
    # update main project
    run "git add .; git commit -am 'updates'; git push"
    # build jekyll
    run "jekyll build;"
    # push _site output
    run "cd _site; git add .; git commit -am 'updates'; git push"
  end
  
  desc "preview", "preview the site"
  def preview
    puts "previewing the site"
    
    # build jekyll
    run "bundle exec jekyll serve --host $IP --port $PORT"
  end
end