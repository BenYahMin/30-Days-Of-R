# ------------------------------------------------------------------------------
# 5. DAY 5 CHALLENGE
# ------------------------------------------------------------------------------
print("--- 5. Challenge Verification ---")

# 1. Construct a dataframe containing 4 columns: product_name, category (factor), 
#    unit_price, and inventory_count.
inventory_df <- data.frame(
  product_name    = c("Laptop", "Mouse", "Keyboard", "Monitor"),
  category        = factor(c("Tech", "Accessory", "Accessory", "Tech")),
  unit_price      = c(1200, 25, 45, 300),
  inventory_count = c(10, 150, 85, 0)
)

# 2. Add a calculated column called 'total_asset_value' (unit_price * inventory_count)
inventory_df$total_asset_value <- inventory_df$unit_price * inventory_df$inventory_count

# 3. Use logical filtering to return rows where inventory_count is exactly 0 (Out of stock).
out_of_stock_df <- inventory_df[inventory_df$inventory_count == 0, , drop = FALSE]

print("Final Evaluated Challenge Data Frame Layout:")
print(inventory_df)
print("Isolated Out of Stock Records:")
print(out_of_stock_df)