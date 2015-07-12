require "spec_helper"
require "rea/robot/application"

describe Rea::Robot::Application do
  let(:application) { described_class.new }

  it 'creates opened application' do
    expect(application).not_to be_closed
  end

  describe '#perform_command' do
    def run *args
      application.perform_command(*args)
    end

    it 'closes application on exit command' do
      run 'exit'
      expect(application).to be_closed
    end

    it 'does not close application on other commands' do
      run 'move'
      expect(application).not_to be_closed
    end

    it 'returns string for any command' do
      expect(run('exit'                ).class).to eq String
      expect(run('place 1,1,north'     ).class).to eq String
      expect(run('report'              ).class).to eq String
      expect(run('move'                ).class).to eq String
      expect(run('some_unknown_command').class).to eq String
      expect(run(''                    ).class).to eq String
      expect(run(nil                   ).class).to eq String
    end

    it 'returns string even when no command recieved' do
      expect(run.class).to eq String
    end


    context 'place command' do

      it 'places robot' do
        expect(run 'report'            ).to eq ''
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'report'            ).to eq '1,1,NORTH'
      end

      it 'changes place of robot' do
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'report'            ).to eq '1,1,NORTH'
        expect(run 'place', '2,3,west' ).to eq ''
        expect(run 'report'            ).to eq '2,3,WEST'
      end

      it 'does not allow to put robot outside board' do
        expect(run 'report'            ).to eq ''
        expect(run 'place', '7,1,north').to eq ''
        expect(run 'report'            ).to eq ''
      end

      it 'does not affect on robot when tried to put it outside board' do
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'report'            ).to eq '1,1,NORTH'
        expect(run 'place', '7,1,north').to eq ''
        expect(run 'report'            ).to eq '1,1,NORTH'
      end

      # TODO Add tests for invalid input like 1,b,ololo
    end

    context 'move command' do

      it 'moves robot' do
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'move'              ).to eq ''
        expect(run 'report'            ).to eq '1,2,NORTH'
      end

      # TODO Add tests for bad movements

    end


  end

end
