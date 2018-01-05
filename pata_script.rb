require 'fileutils'

files = Dir.glob("*.mp3")

kpatha = "krama_pata_1"
jpatha = "jata_pata_2"
spatha = "sikha_pata_3"
gpatha = "ghana_pata_4"
dpatha = "dhvaja_pata_5"




#list of files , in sorted order
r = Regexp.new("([0-9]+).mp3")
b = files.sort do |f1, f2|
  n1 = r.match(f1)[1].to_i
  n2 = r.match(f2)[1].to_i
  n1 <=> n2
end
puts b
# prest dirctory 

dirname = File.basename(Dir.getwd).tr(' ','_')
system("mkdir #{kpatha}")
system("mkdir #{jpatha}")
system("mkdir #{spatha}")
system("mkdir #{gpatha}")
system("mkdir #{dpatha}")


tlimit = b.length;
limit = tlimit-2;

# ghana kpatha generation
  
for counter in 0..limit
  ` cat #{b[counter]} #{b[counter+1]} > #{kpatha}/#{counter+1}.mp3 `
  ` cat #{kpatha}/#{counter+1}.mp3 ../Beep.mp3 >> ../#{dirname}_#{kpatha}.mp3 `	

  ` cat #{b[counter]} #{b[counter+1]} #{b[counter+1]} #{b[counter]} #{b[counter]} #{b[counter+1]} > #{jpatha}/#{counter+1}.mp3 `
  ` cat #{jpatha}/#{counter+1}.mp3 ../Beep.mp3 >> ../#{dirname}_#{jpatha}.mp3 `

	if counter < limit

  		` cat #{b[counter]} #{b[counter+1]} #{b[counter+1]} #{b[counter]} #{b[counter]} #{b[counter+1]} #{b[counter+2]}   > #{spatha}/#{counter+1}.mp3` 
  		` cat #{spatha}/#{counter+1}.mp3 ../Beep.mp3 >> ../#{dirname}_#{spatha}.mp3 `	

  		` cat #{b[counter]} #{b[counter+1]} #{b[counter+1]} #{b[counter]} #{b[counter]} #{b[counter+1]} #{b[counter+2]} #{b[counter+2]} #{b[counter+1]} #{b[counter]} #{b[counter]} #{b[counter+1]} #{b[counter+2]} > #{gpatha}/#{counter+1}.mp3 `
  		` cat #{gpatha}/#{counter+1}.mp3 ../Beep.mp3 >> ../#{dirname}_#{gpatha}.mp3 `
	
	end
		
	` cat #{b[counter]} #{b[counter+1]} ../Beep.mp3 #{b[tlimit-counter-2]} #{b[tlimit-counter-1]} > #{dpatha}/#{counter+1}.mp3 `
  	` cat #{dpatha}/#{counter+1}.mp3 ../Beep.mp3 ../Beep.mp3  >> ../#{dirname}_#{dpatha}.mp3 `
	

end

` id3tag -w -n -akpc -A#{dirname} -s#{dirname}_#{kpatha}_#{limit+1} -t1 ../#{dirname}_#{kpatha}.mp3 `
` id3tag -w -n -akpc -A#{dirname} -s#{dirname}_#{jpatha}_#{limit+1} -t2 ../#{dirname}_#{jpatha}.mp3 `
` id3tag -w -n -akpc -A#{dirname} -s#{dirname}_#{spatha}_#{limit+1} -t3 ../#{dirname}_#{spatha}.mp3 `
` id3tag -w -n -akpc -A#{dirname} -s#{dirname}_#{gpatha}_#{limit+1} -t4 ../#{dirname}_#{gpatha}.mp3 `
` id3tag -w -n -akpc -A#{dirname} -s#{dirname}_#{dpatha}_#{limit+1} -t5 ../#{dirname}_#{dpatha}.mp3 `




`rm -rf #{kpatha} `	
`rm -rf #{jpatha} `	
`rm -rf #{spatha} `	
`rm -rf #{gpatha} `	
`rm -rf #{dpatha} `	

puts "patha done"

