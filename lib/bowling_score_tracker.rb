
class ScoreTracker

  def initialize(io)
    @io = io
    @total = {}
    @frame = 1
    @strike = false
    @spare = false
  end

  def run
    10.times do
      puts "Frame: #{@frame}"
      roll_1 = @io.gets.chomp.to_i

      if roll_1 == 10 && @strike
        @total["#{@frame - 1}"] = 20
        @frame += 1
        next
      end

      
      if roll_1 == 10 && @spare
        @total["#{@frame - 1}"] = (roll_1 + 10)
        @frame += 1
        @strike = true
        @spare = false
        next
      end

      if @spare
        spare(roll_1)
        next
      end

      if roll_1 == 10
        @frame += 1
        @strike = true
        next
      end

      roll_2 = @io.gets.chomp.to_i

      if roll_1 + roll_2 == 10
        @frame += 1
        @spare = true
        next
      end

      if @strike
        strike(roll_1, roll_2)
        next
      end

      @total["#{@frame}"] = (roll_1 + roll_2)
      @frame += 1
    end
    return @total
  end


  def strike(roll_1, roll_2)
    @total["#{@frame - 1}"] = (roll_1 + roll_2 + 10)
    @total["#{@frame}"] = (roll_1 + roll_2)
    @frame += 1
    @strike = false
  end
  
  def spare(roll_1)
    @total["#{@frame - 1}"] = (roll_1 + 10)
    roll_2 = @io.gets.chomp.to_i
    @total["#{@frame}"] = (roll_1 + roll_2)
    @frame += 1
    @spare = false
  end 
end

score_tracker = ScoreTracker.new(Kernel)
score_tracker.run



