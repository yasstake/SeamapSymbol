
import svgutils.transform as sg
import sys 

#width = 60
#height = 60
#svgIn = 'E60_60/Light_Major.svg'
#svgOut = 'Light_Major.svg'

argv = sys.argv

width = int(argv[1])
height = int(argv[2])
svgIn = argv[3]
svgOut = argv[4]

file = sg.SVGFigure(str(width), str(height))

icon = sg.fromfile(svgIn).getroot()

icon.moveto(-(300-width)/2, -(400-height)/2)

file.append(icon)
file.save(svgOut)
