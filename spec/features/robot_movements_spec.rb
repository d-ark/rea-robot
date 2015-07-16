require "spec_helper"

describe "Rea Robot" do
  let(:exe) { File.expand_path('../../../bin/rea-robot', __FILE__) }

  let(:cmd) {"#{exe}" }

  it "does simple moving" do
    inputs = ["PLACE 0,0,NORTH", "MOVE", "REPORT"]

    process = run_interactive(cmd)
    inputs.each { |input_line| type input_line }
    close_input

    expect(process.output).to eq("0,1,NORTH\n")
  end

  it "does simple rotating" do
    inputs = ["PLACE 0,0,NORTH", "LEFT", "REPORT", "EXIT"]

    process = run_interactive(cmd)
    inputs.each { |input_line| type input_line }

    expect(process.output).to eq("0,0,WEST\n")
  end

  it "does not fail" do
    inputs = ["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT", "EXIT"]

    process = run_interactive(cmd)
    inputs.each { |input_line| type input_line }

    expect(process.output).to eq("3,3,NORTH\n")
  end

  pending "places an object to board and robot picks it" do
    inputs = ["PLACE 0,0,NORTH", "PLACEOBJECT 0,1 BALL", "MOVE", "PICKOBJECT", "REPORT"]

    process = run_interactive(cmd)
    inputs.each { |input_line| type input_line }
    close_input

    expect(process.output).to eq("0,1,NORTH BALL\n")
  end
end
