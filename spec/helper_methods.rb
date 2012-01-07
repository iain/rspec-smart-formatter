module HelperMethods

  def create_specs(count = 1)
    create_file "spec/sample_spec.rb" do |f|
      f.puts "describe 'something' do"
      count.times do |i|
        f.puts "  it 'the description of the specs' do;  end"
      end
      f.puts "end"
    end
  end

  def run_specs
    @stdout = ""
    @stderr = ""
    Open3.popen3("bundle exec rspec") do |stdin, stdout, stderr, thr|
      @stdout << stdout.read
      @stderr << stderr.read
    end
    if @stderr != ""
      puts @stderr
    end
  end

  def create_gemfile(*gems)
    create_file "Gemfile" do |f|
      f.puts "source :rubygems"
      f.puts "gem 'rspec'"
      f.puts "gem 'rspec-smart-formatter', :require => false, :path => '#{PROJECT_DIR}'"
      gems.each do |gem|
        f.puts "gem '#{gem}', :require => false"
      end
    end
    `bundle check || bundle install`
  end

  def create_file(filename)
    FileUtils.mkdir_p File.dirname(filename)
    File.open filename, 'w' do |f|
      yield f
    end
  end

end
