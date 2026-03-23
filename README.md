# High performance amplifier (HPA) - UNIC-CASS Postulations by Fundación Fulgor

## Pin List for the project

| Pin Name | Type    | Direction     | Description            |
|----------|--------|--------------|------------------------  |
| VDD      | Power  | Bidirectional | Positive power supply   |
| VREF     | Analog | Bidirectional | Voltage reference       |
| VSS      | Power  | Bidirectional | Negative power supply   |
| VINp     | Analog | Input         | Input positive voltage  |
| VINn     | Analog | Input         | Input negative voltage  | 
| VOUTn    | Analog | Output        | Output negative voltage |
| VOUTp    | Analog | Output        | Output positive voltage |

## Team Members:

- Over Amaya       (MSc in EE Student at UNS)
- Santiago Recalde (MSc in EE Student at UNS)
- Ezequiel Giorgis (BSc in EE Student at UNT)
- Juan Moran       (BSc in EE Student at UNT)

## Project
### High Performance Amplifier Topology
![Project](Figures/HPA_Topology.svg)

This repository contains 2 folders, "OTA_Telescopic", lasted version and "OTA_Telescopic_backup".

Inside the "OTA_Telescopic" folder there are three directories:

#### "Schematics_and_Symbols": contains all schematics, symbols, and IOCells for the designs.
- OTA_Telescopic_CMFB.sch/sym: schematic and symbol of the common-mode feedback (CMFB).
- OTA_Telescopic_currentRef.sch/sym: schematic and symbol of the current reference.
- OTA_Telescopic_core.sch/sym: schematic and symbol of the OTA core.
- OTA_Telescopic_FB.sch/sym: schematic and symbol of the OTA with resistive feedback.
- Buffer.sch/sym: Output Buffer.
- OTA_Telescopic_TOP_wp.sch/sym: schematic and symbol of all HPA blocks integrated together, but with floating/unconnected terminals left for measuring the circuit response in post-layout simulations.
- OTA_Telescopic_TOP_IOCells.sch/sym: schematic and symbol of OTA_Telescopic_TOP_wp.sch, but including the IOCell connections in order to examine their effects on circuit operation.
- HPA.sch/sym: schematic and symbol of the HPA.
- HPA_IOCells.sch: schematic of the HPA including the IOCell connections, provided as a reference for how the terminals are wired.

####  "Layout_and_Related_files": contains the layouts of the designs along with other related files.

- OTA_Telescopic_CMFB.gds: contains the layout of the common-mode feedback circuit, DRC- and LVS-clean.
- OTA_Telescopic_currentRef.gds: contains the layout of the current reference circuit, DRC- and LVS-clean.
- OTA_Telescopic_core.gds: contains the layout of the OTA core, DRC- and LVS-clean.
- OTA_Telescopic_FB.gds: contains the layout of the OTA with resistive feedback, DRC- and LVS-clean.
- OTA_Telescopic_TOP_wp.gds: contains the layout of all HPA blocks integrated together, DRC- and LVS-clean, but with floating/unconnected terminals left for measuring the circuit response in post-layout simulations.
- Buffer.gds: contains the layout of the Buffer circuit, DRC- and LVS-clean.
- HPA.gds: contains the layout of the HPA circuit, DRC- and LVS-clean.
- HPA_user_project_wrapper.gds: contains the layout of the HPA inside the pad ring.

####  "Testbenchs": contains all tests performed on the design, with and without IOCells, as well as the "simulations" folder.

- OTA_Telescopic_TOP_TB_CMFB.sch: CMFB stability testbench.
- OTA_Telescopic_TOP_TB_CL.sch: closed-loop testbench.
- OTA_Telescopic_TOP_TB_OL.sch: open-loop testbench.
- OTA_Telescopic_TOP_TB_StartUp.sch: startup testbench.
- Testbenches that include "io" correspond to the same analyses performed while accounting for the effects of the IOCells.

## References

[1] F. Tolosa, E. Dri, Á. F. Bocco and B. T. Reyes, "High Performance Amplifier in 130nm CMOS Technology using an Open Source Design Flow for 10Gbase-T Ethernet Transceivers," 2023 Argentine Conference on Electronics (CAE), Cordoba, Argentina, 2023, pp. 75-80, doi: 10.1109/CAE56623.2023.10087008.

[2] B. Razavi, Design Of Analog Cmos Integrated Circuit , 2Nd Edition, Mc Graw Hill India, 2017

[3] P. E. Allen and D. R. Holberg, CMOS Analog Circuit Design, 3rd ed. New York, NY: Oxford University Press, 2011.
