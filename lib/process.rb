require '/usr/local/etc/appu/lib/helper'

def kill(term)
  list = guess term
  if list.size == 1
    res = %x(ps aux | grep "#{list[0].gsub(" ","\\ ")}")
    whoami = %x(whoami).chomp
    puts "Do you really want #{list[0]} be dead? [Y/n]"
    ans = $stdin.gets.chomp
    if (ans.downcase == "y")
      res.split(whoami).each do |l|
        if (!l.include? "grep")
          system ("kill #{split_by_space(l)}")
        end
      end
    else
    end
  else
    puts list
  end
end

