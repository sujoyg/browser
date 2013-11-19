require 'spec_helper'
require 'globals'

describe 'config/support/globals.yml' do
  let(:user) { random_text }
  let(:globals) do
    with_user(user) do
      configs = [:development, :production, :test].map do |e|
        [e, Globals.read('config/support/globals.yml', e)]
      end
      Hash[*configs.flatten]
    end
  end

  [:development, :production, :test].each do |environment|
    it "should not raise any error for #{environment}." do
      expect { Globals.read('config/support/globals.yml', environment) }.to_not raise_error
    end
  end

  it 'should raise an error for unknown environments.' do
    expect {
      Globals.read('config/support/globals.yml', 'foo')
    }.to raise_error('Globals were not defined for environment: foo in config/support/globals.yml')
  end

  describe 'application' do
    [:development, :production, :test].each do |environment|
      it environment do
        globals[environment].application.should == 'Browser'
      end
    end
  end

  describe 'deployment' do
    describe 'dir' do
      it 'production' do
        globals[:production].deployment.dir.should == '/mnt/deployment/browser'
      end
    end

    describe 'host' do
      it 'production' do
        globals[:production].deployment.host.should == 'www.browser.com'
      end
    end

    describe 'repository' do
      [:development, :production, :test].each do |environment|
        it environment do
          globals[environment].deployment.repository.should == "git@github.com:#{user}/browser.git"
        end
      end
    end

    describe 'user' do
      it 'production' do
        globals[:production].deployment.user.should == 'user'
      end
    end
  end

  describe 'host' do
    it 'development' do
      globals[:development].host.should == 'localhost:3000'
    end

    it 'production' do
      globals[:production].host.should == 'www.browser.com'
    end

    it 'test' do
      globals[:test].host.should == 'test.host'
    end
  end

  describe 'token' do
    [:development, :production, :test].each do |environment|
      it environment do
        globals[environment].token.should == '2def5bdfe89f8dda89d37fb95932483450cf995b20252fc60cbe82cf1e0688504a79c25bfcc52c123c9d37cc3b806753854b9b473e4f3ba8db415bbe40390fe6'
      end
    end
  end
end