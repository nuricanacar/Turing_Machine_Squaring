class Turing_machine_squaring
    attr_accessor :konum, :num, :tape
    def initialize(num)
    @konum = 1 
    @tape = ['b']
    i = 0 
        while i < num
            @tape << '0'
            i +=1
        end
    @tape << '1'
    i = 0
        while i < num
            @tape << '0'
            i +=1
        end
    @tape << '1'
    i = -1
        while i < (num*num)
            @tape << 'b'
            i +=1
        end
    end
    
    def R
        @konum += 1
        
    end
    
    def L
        @konum -= 1
    end

    def square
        state = 'q0'
        while (state != 'q12')
        case state
        when 'q0'
            if tape[self.konum] == '0'
                tape[self.konum] = 'b'
                self.R
                state = 'q6'
            else
                return
            end
        when 'q1'
            if tape[self.konum] == '0'
                tape[self.konum] = '2'
                self.R
                state = 'q2'
            elsif tape[self.konum] == '1'
                tape[self.konum] = '1'
                self.L
                state = 'q4'
            else
                return
            end
        when 'q2'
            if tape[self.konum] == '0'
                tape[self.konum] = '0'
                self.R
                state = 'q2'
            elsif tape[self.konum] == '1'
                tape[self.konum] = '1'
                self.R
                state = 'q2'
            elsif tape[self.konum] == 'b'
                tape[self.konum] = '0'
                self.L
                state = 'q3'
            else
                return
            end
        when 'q3'
            if tape[self.konum] == '0'
                tape[self.konum] = '0'
                self.L
                state = 'q3'
            elsif tape[self.konum] == '1'
                tape[self.konum] = '1'
                self.L
                state = 'q3'
            elsif tape[self.konum] == '2'
                tape[self.konum] = '2'
                self.R
                state = 'q1'
            else
                return
            end
        when 'q4'
            if tape[self.konum] == '1'
                tape[self.konum] = '1'
                self.R
                state = 'q5'
            elsif tape[self.konum] == '2'
                tape[self.konum] = '0'
                self.L
                state = 'q4'
            else
                return
            end
        when 'q5'
            if tape[self.konum] == '0'
                tape[self.konum] = '0'
                self.L
                state = 'q7'
            else
                return
            end
        when 'q6'
            if tape[self.konum] == '0'
                tape[self.konum] = '0'
                self.R
                state = 'q6'
            elsif tape[self.konum] == '1'
                tape[self.konum] = '1'
                self.R
                state = 'q1'
            else
                return
            end
        when 'q7'
            if tape[self.konum] == '1'
                tape[self.konum] = '1'
                self.L
                state = 'q8'
            else
                return
            end
        when 'q8'
            if tape[self.konum] == '0'
                tape[self.konum] = '0'
                self.L
                state = 'q9'
            elsif tape[self.konum] == 'b'
                tape[self.konum] = 'b'
                self.R
                state = 'q10'
            else
                return
            end
        when 'q9'
            if tape[self.konum] == '0'
                tape[self.konum] = '0'
                self.L
                state = 'q9'
            elsif tape[self.konum] == 'b'
                tape[self.konum] = 'b'
                self.R
                state = 'q0'
            else
                return
            end
        when 'q10'
            if tape[self.konum] == '1'
                tape[self.konum] = 'b'
                self.R
                state = 'q11'
            else
                return
            end
        when 'q11'
            if tape[self.konum] == '0'
                tape[self.konum] = 'b'
                self.R
                state = 'q11'
            elsif tape[self.konum] == '1'
                tape[self.konum] = 'b'
                self.R
                state = 'q12'
            else
                return
            end
        when 'q12'
            state = 'q12'
        else
            return
        end
    
    state == 'q12'
end
    end

    def result
        a = 0
        for nm in tape
            if nm == '0'
                a += 1
            else
            end
        end
        a
    end
    
end
print 'Sayı girin: '
num = gets.chomp.to_i
tm = Turing_machine_squaring.new(num)
print "Tape : "
p tm.tape
tm.square
puts  "#{num} sayısının karesi #{tm.result}"
print "Tape : "
p tm.tape