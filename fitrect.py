
import svgutils.transform as sg
import sys 
import os


#width = 60
#height = 60
#svgIn = 'E60_60/Light_Major.svg'
#svgOut = 'Light_Major.svg'

argv = sys.argv

width = int(argv[1])
height = int(argv[2])
svgIn = argv[3]
svgOut = argv[4]
scale= float(argv[5])

file = sg.SVGFigure(str(width*scale), str(height*scale))

icon = sg.fromfile(svgIn).getroot()

icon.moveto(-(300-width)*scale/2, -(400-height)*scale/2, scale=scale)

file.append(icon)

tmpfile=svgOut + "tmp"

file.save(svgOut)
#file.save(tmpfile)
#os.system("svgo -i " + tmpfile  + " -o " + svgOut + " --enable=transformsWithOnePath")
#os.remove(tmpfile)

