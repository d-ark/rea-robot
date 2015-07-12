require "spec_helper"
require "rea/robot/application"

describe Rea::Robot::Application do
  let(:application) { described_class.new }

  it 'creates opened application' do
    expect(application).not_to be_closed
  end

  describe '#perform_command' do
    it 'closes application on exit command' do
      application.perform_command('exit')
      expect(application).to be_closed
    end

    it 'does not close application on exit command' do
      application.perform_command('move')
      expect(application).not_to be_closed
    end

    it 'returns string for any command' do
      expect(application.perform_command('exit').class).to eq String
      expect(application.perform_command('place 1,1,north').class).to eq String
      expect(application.perform_command('report').class).to eq String
      expect(application.perform_command('move').class).to eq String
      expect(application.perform_command('some_unknown_command').class).to eq String
      expect(application.perform_command('').class).to eq String
      expect(application.perform_command(nil).class).to eq String
      expect(application.perform_command().class).to eq String
    end
  end

end
