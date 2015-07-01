import sys
import xml.etree.ElementTree as ET

# Filter program that Read SVG fromstream, and write SVG to stdout
#   param1: bounds type R:rectangle, E:eclipse
#   param2: rx
#   param3: ry


param = sys.argv;

boundsType = param[1]
boundsWidth = int(param[2])
boundsHeight = int(param[3])
    
xmlString = sys.stdin.read();

tree = ET.fromstring(xmlString)
#tree = ET.parse(xmlFile)

ET.register_namespace('', 'http://www.w3.org/2000/svg')

root=tree.find(".");

width=int(root.get("width"))
height=int(root.get("height"))

print "w=" ,str(width), "H=", str(height)

center_x = int(width)  / 2
center_y = int(height) / 2

bounds = None

if param[1]=="E":
    bounds = ET.Element('eclipse')
    bounds.set("cx", str(center_x))
    bounds.set("cy", str(center_y))
    bounds.set("rx", str(boundsWidth))
    bounds.set("ry", str(boundsHeight))
    bounds.set("fill", "#333")
    bounds.set("opacity", str(0.1))

if param[1]=="R":
    bounds = ET.Element('rect')
    bounds.set("x", str(center_x - width))
    bounds.set("y", str(center_y - height))
    bounds.set("width", str(boundsWidth + width))
    bounds.set("hight", str(boundsHeight + height))
    bounds.set("fill", "#333")
    bounds.set("opacity", str(0.1))


root.append(bounds);


r = 0;
if center_x < center_y:
    r = center_x / 1.2
else:
    r = center_y / 1.2


print ET.tostring(tree)
#ElementTree(tree).write(sys.stdout, "UTF-8", True)

