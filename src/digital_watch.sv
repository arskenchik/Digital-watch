module digital_watch(
  input wire i_clk,
  input wire i_rst,
  input wire i_adjust_time,
  input wire [4:0] i_hour_new,
  input wire [5:0] i_minute_new,
  input wire [5:0] i_second_new, 
  input wire i_set_alarm,
  input wire i_turn_off_alarm,
  output logic [4:0] o_hour,
  output logic [5:0] o_minute,
  output logic [5:0] o_second,
  output logic o_alarm
);
  logic [4:0] current_hour;
  logic [5:0] current_minute;
  logic [5:0] current_second;
  logic [4:0] alarm_hour;
  logic [5:0] alarm_minute;
  logic [5:0] alarm_second;
  logic bool;
  
  // Reset Logic and Time Counting
  always_ff @(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
      current_hour <= 0;
      current_minute <= 0;
      current_second <= 0;
      bool <= 0;
      o_hour <= 0;
      o_minute <= 0;
      o_second <= 0;
    end 
    else if (i_adjust_time) begin
      current_hour <= i_hour_new;
      current_minute <= i_minute_new;
      current_second <= i_second_new;
      bool <= 1;
    end
    else if (!i_adjust_time && bool) begin
      o_hour <= current_hour;
  	  o_minute <= current_minute;
      o_second <= current_second;
      bool <= 0;
    end
    // Normal Mode: Time Counting
    else begin
      if (o_second == 59) begin
        o_second <= 0;
        if (o_minute == 59) begin
          o_minute <= 0;
          if (o_hour == 23) begin
            o_hour <= 0;
          end 
          else begin
            o_hour <= o_hour + 1;
          end
        end
        else begin
          o_minute <= o_minute + 1;
        end
      end 
      else begin
        o_second <= o_second + 1;
      end
    end
  end
  
  // Current time output
 

  // Alarm Setting
  always_ff @(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
      alarm_hour <= 0;
      alarm_minute <= 0;
      alarm_second <= 0;
    end 
    else if (i_set_alarm) begin
      alarm_hour <= i_hour_new;
      alarm_minute <= i_minute_new;
      alarm_second <= i_second_new;
    end
  end
  
  // Alarm Trigger
  always @(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
      o_alarm <= 0;
    end
    else if (!i_set_alarm && o_hour == alarm_hour && o_minute == alarm_minute && o_second == alarm_second-1) begin
      o_alarm <= 1;
    end
  end
  always @(negedge i_turn_off_alarm) begin
    o_alarm <= 0;
  end
endmodule 