import sys
import xml.etree.ElementTree as ET

# Filter program that Read SVG fromstream, and write SVG to stdout
#   param1: bounds type R:rectangle, E:ellipse
#   param2: rx
#   param3: ry


param = sys.argv

boundsType = param[1]
boundsWidth = int(param[2])
boundsHeight = int(param[3])
    
xmlString = sys.stdin.read()

tree = ET.fromstring(xmlString)
#tree = ET.parse(xmlFile)

ET.register_namespace('', 'http://www.w3.org/2000/svg')

root=tree.find(".");

width=int(root.get("width"))
height=int(root.get("height"))


center_x = width  / 2
center_y = height / 2

bounds = None

if param[1]=="E":
    bounds = ET.Element('ellipse')
    bounds.set("cx", str(center_x))
    bounds.set("cy", str(center_y))
    bounds.set("rx", str(boundsWidth))
    bounds.set("ry", str(boundsHeight))

if param[1]=="R":
    bounds = ET.Element('rect')
    bounds.set("x", str(center_x - boundsWidth))
    bounds.set("y", str(center_y - boundsHeight))
    bounds.set("width", str(boundsWidth*2))
    bounds.set("height", str(boundsHeight*2))


bounds.set("fill", "#fff")
bounds.set("opacity", "0.0001")
root.append(bounds);


print(ET.tostring(tree, encoding='utf-8', method='xml').decode('utf-8'))


