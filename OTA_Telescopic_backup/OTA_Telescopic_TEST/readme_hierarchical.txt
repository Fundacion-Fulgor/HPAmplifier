##inv_PI_d2 — jerarquía + autoload + leaf PCells (sin gallery)

klayout -n sg13g2 -zz -r ./hierarchical.py \
  -rd netlist=./simulations/inv_PI_d2.spice \
  -rd output=./inv_PI_d2.gds \
  -rd autoload=1 \
  -rd reuse_dir=. \
  -rd leaf=1 \
  -rd gallery=0

##nand_custom — top “solo dispositivos” (sin reusar celdas jerárquicas), genera PCells leaf directamente (sin gallery)

klayout -n sg13g2 -zz -r ./hierarchical.py \
  -rd netlist=./simulations/nand_custom.spice \
  -rd output=./nand_custom.gds \
  -rd leaf=1 \
  -rd gallery=0
