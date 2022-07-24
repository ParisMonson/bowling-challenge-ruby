require 'bowling_score_tracker'

RSpec.describe "BowlingScoreTracker" do
  it "adds both rolls when no strike/spare" do
    io_dbl = double :io
    expect(io_dbl).to receive(:gets).and_return("3")
    expect(io_dbl).to receive(:gets).and_return("6")

    expect(score_tracker(io_dbl)).to eq [9]
  end
  
  it "strike is scored" do
    io_dbl = double :io
    expect(io_dbl).to receive(:gets).and_return("10")

    expect(io_dbl).to receive(:gets).and_return("5")
    expect(io_dbl).to receive(:gets).and_return("2")


    expect(score_tracker(io_dbl)).to eq [17, 7]
  end
end