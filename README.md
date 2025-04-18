# final-year-project
![Screenshot 2025-03-18 190452](https://github.com/user-attachments/assets/ef38dbed-b759-4c6f-8fb7-3071079a3b9f)
The goal of this project was to design a floating-point multiplier optimized for area and power efficiency, intended for use in error-tolerant applications like machine learning, digital signal processing (DSP), and IoT edge devices.
Objectives:
Minimize power consumption and chip area

Maintain acceptable computational accuracy

Improve speed and scalability of multiplication operations
 Technical Approach:
Applied approximate computing techniques to the multiplier architecture, reducing logic complexity and power usage.

Integrated the Brent-Kung Adder — a parallel prefix adder known for its logarithmic delay and low fan-out — to handle the accumulation of partial products efficiently.

Focused on trade-offs between accuracy, power, delay, and area, with simulation and comparison against traditional exact multipliers.
Outcomes:
Achieved notable reductions in power and area while keeping the error rate within acceptable bounds

Demonstrated improved latency and throughput, suitable for embedded systems

Validated design using HDL (e.g., Verilog/VHDL), synthesized and tested on FPGA or ASIC platforms (depending on your setup)

Conclusion:
This project illustrates how approximate arithmetic combined with efficient adder architectures like the Brent-Kung adder can produce hardware units that are both performance-oriented and energy-efficient, especially beneficial for next-gen low-power applications.
