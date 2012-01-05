step "I have installed the smart formatter" do
  FileUtils.mkdir_p "spec"
  File.open(".rspec", "w") do |f|
    f << "--format RSpec::Smart::Formatter\n"
    f << "-I #{File.expand_path('../../lib')}\n"
  end
end

step "I run :count specs" do |count|
  File.open("spec/sample_spec.rb", "w") do |f|
    f << "describe 'something' do"
    count.times do |i|
      f << "  it 'the description of the specs' do;  end\n\n"
    end
    f << "end"
  end
  @stdout = ""
  @stderr = ""
  Open3.popen3("rspec") do |stdin, stdout, stderr, thr|
    @stdout << stdout.read
    @stderr << stderr.read
  end
  if @stderr != ""
    puts @stderr
  end
end

step "I should see the documentation output" do
  @stdout.should include("the description of the specs")
end

step "I should see the progress output" do
  @stdout.should include("................")
end

placeholder :count do
  match /\d+/ do |count|
    count.to_i
  end
end
