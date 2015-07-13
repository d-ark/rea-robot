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

To install this application using RVM:

1) Install rvm (http://rvm.io/)

2) Clone the repo from github

    $ git clone https://github.com/d-ark/rea-robot

3) Go to project directory and run bundle

    $ bundle install

4) Start the app with command

    $ ./bin/rea-robot

5) Enjoy!

To run within docker

1) Install docker
2) Clone the repo from github

    $ git clone https://github.com/d-ark/rea-robot

3) Go to project directory and build docker image with provided script

    $ ./bin/docker-build

    OR manualy

    $ docker build -t <DOCKER_IMAGE_NAME> .

4) Start the app with command

    $ ./bin/rea-robot-docker

    OR start container manualy:

    $ docker run -it <DOCKER_IMAGE_NAME>

5) Enjoy!

## Usage

Start the application as explained above and input any commands separated by new line.

The output (for REPORT command only) will appear immidiately after command is entered.

All invalid commands will be ignored

## Contributing

1. Fork it ( https://github.com/d-ark/rea-robot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
