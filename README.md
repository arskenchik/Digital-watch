# Digital Clock with Alarm (Verilog)

## 📌 Project Overview
This project implements a **digital clock** in Verilog that can:
- Display current time (hours, minutes, seconds)
- Adjust the time manually
- Set and trigger an alarm
- Synchronize time operations with a 1 Hz clock signal

The project was developed as part of **EE303** coursework by *Arslan Kenbayev*.

---

## Simulations

![image alt]()

## ⚙️ Features
- **Normal Mode**: Counts time using a 1 Hz clock input.
- **Time Adjustment**: Allows setting a new hour, minute, and second.
- **Alarm Functionality**: Alarm can be set and will trigger when the current time matches.
- **Alarm Control**: Alarm can be turned off with a control signal.

---

## 🔌 Inputs & Outputs

**Inputs**
- `i_clk` : 1 Hz clock input  
- `i_rst` : Asynchronous reset  
- `i_adjust_time` : Enable time adjustment  
- `i_hour_new, i_minute_new, i_second_new` : New time values for adjustment  
- `i_set_alarm` : Enable alarm setting  
- `i_turn_off_alarm` : Turn off the alarm  

**Outputs**
- `o_hour` : Current hour  
- `o_minute` : Current minute  
- `o_second` : Current second  
- `o_alarm` : Alarm signal  

---

## 🖥️ File Structure
- `src/digital_watch.sv` → Main Verilog source code  
- `docs/EE303_Project_Report.docx` → Project report with detailed explanation and results  
- `sim/testbench.sv` → Testbench for simulation (if included)  

---

## 🛠️ Simulation Scenarios
1. **Normal Mode** → Time increments every second.  
2. **Time Adjustment** → Time is reset to new values and continues counting.  
3. **Alarm Trigger** → Alarm turns on when set time matches.  
4. **Alarm Off** → Alarm can be turned off via control input.  

---

## 🚀 How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/digital-clock-verilog.git
   cd digital-clock-verilog
