import xml.etree.ElementTree as ET
import pandas as pd

# Carregar o XML
tree = ET.parse("positionsB.xml")
root = tree.getroot()

# Preparar lista de registros
records = []

# Percorrer cada timestep
for timestep in root.findall("timestep"):
    time = float(timestep.attrib["time"])
    for vehicle in timestep.findall("vehicle"):
        vid = vehicle.attrib["id"]
        x = float(vehicle.attrib["x"])
        y = float(vehicle.attrib["y"])
        speed = float(vehicle.attrib["speed"])
        angle = float(vehicle.attrib["angle"])
        lane = vehicle.attrib.get("lane", "")
        
        records.append({
            "time": time,
            "vehicle_id": vid,
            "x": x,
            "y": y,
            "speed": speed,
            "angle": angle,
            "lane": lane
        })

# Transformar em DataFrame
df = pd.DataFrame(records)

# Exportar para CSV
df.to_csv("positionsB.csv", index=False)

print("✅ positionsB.csv gerado com sucesso!")
