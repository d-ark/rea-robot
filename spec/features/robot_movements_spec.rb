require "spec_helper"

describe "Rea Robot" do
  let(:exe) { File.expand_path('../../../bin/rea-robot', __FILE__) }

  describe "moving forward" do
    let(:cmd) {"#{exe}" }

    it "does simple moving" do
      inputs = ["PLACE 0,0,NORTH", "MOVE", "REPORT", "EXIT"]

      process = run_interactive(cmd)
      inputs.each { |input_line| type input_line }

      expect(process.output).to include("0,1,NORTH")
    end
  end
end
