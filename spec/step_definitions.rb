step "I have installed the smart formatter" do
  create_rspec_config
end

step "I don't have any special formatters installed" do
  run_command "gem uninstall fuubar"
end

step "I have installed Fuubar" do
  run_command "gem install fuubar"
end

step "I run only a couple of specs" do
  create_specs 20
  run_specs
end

step "I run a lot of specs" do
  create_specs 21
  run_specs
end

step "I should see the documentation output" do
  @stdout.should include("the description of the specs")
end

step "I should see the progress output" do
  @stdout.should include("................")
end

step 'I should see the Fuubar output' do
  @stdout.should include("100% |=======")
end
