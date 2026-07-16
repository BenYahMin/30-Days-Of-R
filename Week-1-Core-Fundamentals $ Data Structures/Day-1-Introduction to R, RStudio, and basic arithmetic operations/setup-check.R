{
# ==============================================================================
# 30 DAYS OF R // DAY 1 SYSTEM CHECK
# ==============================================================================

print("📡 Initiating system diagnostic trace...")

# Capture environment data parameters
r_version <- R.version$version.string
os_system <- Sys.info()["sysname"]

# Print tracking confirmation matrix
cat("\n========================================\n")
cat("🎉 SUCCESS: Your R Environment is Live!\n")
cat("📍 Engine Version: ", r_version, "\n")
cat("📍 Operating System: ", os_system, "\n")
cat("========================================\n")

print("You are officially ready for Day 2! Clear your console and prepare for variables.")
}

