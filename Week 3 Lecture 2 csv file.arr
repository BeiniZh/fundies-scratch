use context dcic2024
include csv
include data-source

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: NUmber
  source:csv-table-file("recipes.csv", default-options)
    #don't need to specify the name if they are in the same folder, but if they are not in the same file, we need to specify the name of the file.
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end
