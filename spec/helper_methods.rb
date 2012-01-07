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

  def create_rspec_config
    create_file '.rspec' do |f|
      f.puts "--format RSpec::Smart::Formatter"
      f.puts "-I #{File.join(PROJECT_DIR, 'lib')}"
    end
  end

  def run_specs
    run_command "rspec"
  end

  def run_command(command)
    @stdout ||= ""
    @stderr = ""
    Open3.popen3(command) do |stdin, stdout, stderr, thr|
      @stdout << stdout.read
      @stderr << stderr.read
    end
    if @stderr != ""
      puts @stderr
    end
  end

  def create_file(filename)
    FileUtils.mkdir_p File.dirname(filename)
    File.open filename, 'w' do |f|
      yield f
    end
  end

end
