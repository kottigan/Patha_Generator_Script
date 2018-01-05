require 'fileutils'

files = Dir.glob("*.mp3")
patha = "jata_pata_2"


#list of files , in sorted order
r = Regexp.new("([0-9]+).mp3")
b = files.sort do |f1, f2|
  n1 = r.match(f1)[1].to_i
  n2 = r.match(f2)[1].to_i
  n1 <=> n2
end
puts b

# ghana patha generation
dirname = File.basename(Dir.getwd).tr(' ','_')
system("mkdir #{patha}")

limit = b.length;
limit = limit-2;

for counter in 0..limit
  
  #`mp3wrap jata_pata/output#{counter}.mp3 #{b[counter]} #{b[counter+1]} #{b[counter+1]} #{b[counter]} #{b[counter]} #{b[counter+1]} ../end.mp3 `
  ` cat #{b[counter]} #{b[counter+1]} #{b[counter+1]} #{b[counter]} #{b[counter]} #{b[counter+1]} > #{patha}/#{counter+1}.mp3 `
  ` cat #{patha}/#{counter+1}.mp3 ../Beep.mp3 >> ../#{dirname}_#{patha}.mp3 `

end

` id3tag -w -n -akpc -A#{dirname}_#{patha} -s#{dirname}_#{patha}_#{limit+1} -t2 ../#{dirname}_#{patha}.mp3 `

`rm -rf #{patha} `	

puts "jata patha done"
