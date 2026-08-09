# ==========================================
# SOLUTIONS 
# ==========================================

# 1 & 2: Tidy the Weather Data and Calculate Spread
tidy_weather <- weather_wide %>%
   pivot_longer(
     cols = starts_with(c("Max", "Min")),
     names_to = c(".value", "date"),
     names_pattern = "(Max_Temp|Min_Temp)_(.*)"
   ) %>%
   mutate(temp_spread = Max_Temp - Min_Temp)
 
 print("--- Solution: Tidy Weather ---")
 print(tidy_weather)
 
 # 3: Unpack the Alert Logs
 tidy_alerts <- station_alerts %>%
   separate_wider_delim(
     cols = log_entry,
     delim = "_",
     names = c("date", "status_level", "event_type")
   )
 
 print("--- Solution: Tidy Alerts ---")
 print(tidy_alerts)