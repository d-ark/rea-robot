# Rea-Robot - Toy Robot Simulator

## Description


- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but is be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table are ignored, however further valid
  movement commands are still allowed.

The application can read in commands of the following form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) is considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until
  a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot to standard output.

- A robot that is not on the table will ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input.

## Installation

# TODO !!!!!!!!

## Usage

Start the application with `rea-robot` command

    $ rea-robot

And input any commands separated by new line. The output (for REPORT command) will appear immidiately after command is entered.

You can also provide a source file with list of commands using -f option

    $ rea-robot -f robot-program.txt

## Development

# TODO !!!!!!!!

## Contributing

1. Fork it ( https://github.com/d-ark/rea-robot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
