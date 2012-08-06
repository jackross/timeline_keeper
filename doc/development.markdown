cd test/dummy
mkdir test
cd test
ln -s ../../../test/fixtures fixtures
cd ../..
bundle exec rake db:fixtures:load