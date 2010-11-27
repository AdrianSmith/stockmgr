namespace :test do
  desc 'Measures test coverage'
  task :coverage do
    rm_f "coverage"
    rm_f "coverage.data"
    rcov = "rcov -Itest --rails --aggregate coverage.data -T -x \" rubygems/*,/Library/Ruby/Site/*,gems/*,rcov*\""
    system("#{rcov} --no-html spec/**/*_spec.rb")
    system("open coverage/index.html") if PLATFORM['darwin']
  end

  desc 'Runs all the tests'
  task :all do
    errors = %w(spec cucumber).collect do |task|
      begin
        Rake::Task[task].invoke
        nil
      rescue => e
        task
      end
    end.compact
    abort "Errors running #{errors.to_sentence(:locale => :en)}!" if errors.any?
  end
end