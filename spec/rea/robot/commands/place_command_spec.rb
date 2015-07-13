require "spec_helper"

module Rea
  module Robot
    describe PlaceCommand do

      def command(args)
        described_class.new(robot, Array(args))
      end

      def position robot
        robot.build_view(Views::RobotView).to_s
      end

      let(:invlid_arguments) do
        [
          '2,2,ololo',
          '2,2',
          '7,2,west',
          'string',
          '',
          []
        ]
      end

      context 'new robot' do
        let(:robot) do
          Robot.new(
            Board.new(5,5),
            BoardCellFactory.build(nil, nil),
            DirectionFactory.build(nil)
          )
        end

        it 'places robot' do
          expect { command('1,1,north').call }.to change { position robot }.from('').to('1,1,NORTH')
        end

        it 'ignores all invlid commands' do
          invlid_arguments.each do |arg|
            expect { command(arg).call }.not_to change {position robot}
          end
        end

        it 'returns empty sting' do
          expect(command('2,2,west').call).to eq ''
        end

        it 'returns empty sting for invlid commands' do
          invlid_arguments.each do |arg|
            expect(command(arg).call).to eq ''
          end
        end
      end

      context 'with placed robot' do
        let(:robot) do
          Robot.new(
            Board.new(5,5),
            BoardCellFactory.build(3, 3),
            DirectionFactory.build('east')
          )
        end

        it 'places robot' do
          expect { command('1,1,north').call }.to change { position robot }.from('3,3,EAST').to('1,1,NORTH')
        end

        it 'ignores all invlid commands' do
          invlid_arguments.each do |arg|
            expect { command(arg).call }.not_to change {position robot}
          end
        end

        it 'returns empty sting' do
          expect(command('2,2,west').call).to eq ''
        end

        it 'returns empty sting for invlid commands' do
          invlid_arguments.each do |arg|
            expect(command(arg).call).to eq ''
          end
        end
      end

    end
  end
end
