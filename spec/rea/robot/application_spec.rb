require "spec_helper"

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

      it 'does not allow to place robot outside board' do
        expect(run 'report'            ).to eq ''
        expect(run 'place', '7,1,north').to eq ''
        expect(run 'report'            ).to eq ''
      end

      it 'does not affect on robot when tried to place it outside board' do
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'report'            ).to eq '1,1,NORTH'
        expect(run 'place', '7,1,north').to eq ''
        expect(run 'report'            ).to eq '1,1,NORTH'
      end

      it 'does not allow to place robot with bad direction' do
        expect(run 'report'            ).to eq ''
        expect(run 'place', '1,1,ololo').to eq ''
        expect(run 'report'            ).to eq ''
      end

      it 'does not allow to place robot without direction' do
        expect(run 'report'      ).to eq ''
        expect(run 'place', '1,1').to eq ''
        expect(run 'report'      ).to eq ''
      end

      it 'does not allow to place robot on not integer coordinates' do
        expect(run 'report'            ).to eq ''
        expect(run 'place', 'a,1,north').to eq ''
        expect(run 'report'            ).to eq ''
      end

      it 'does not allow to place robot if no arguments provided' do
        expect(run 'report').to eq ''
        expect(run 'place' ).to eq ''
        expect(run 'report').to eq ''
      end
    end

    context 'move command' do

      it 'moves robot' do
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'move'              ).to eq ''
        expect(run 'report'            ).to eq '1,2,NORTH'
      end

      it 'does not move robot outside' do
        expect(run 'place', '0,0,south').to eq ''
        expect(run 'move'              ).to eq ''
        expect(run 'report'            ).to eq '0,0,SOUTH'
      end
    end

    context 'rotate commands' do
      it 'rotates left' do
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'left'              ).to eq ''
        expect(run 'report'            ).to eq '1,1,WEST'
      end

      it 'rotates right' do
        expect(run 'place', '1,1,north').to eq ''
        expect(run 'right'             ).to eq ''
        expect(run 'report'            ).to eq '1,1,EAST'
      end
    end
  end

end
