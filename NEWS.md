# EDIutils 1.6.1

### Bug fix

* __read_tables():__ Columnn names beginning with an underscore (e.g. "_2_5_mm") were being prefixed with "X" (e.g. "X_2_5_mm"). This is no longer occuring.

# EDIutils 1.6.0

### Enhancement

* __read_tables():__ Remove leading and trailing white space from character fields when `strip.white = TRUE`, even when quoted.

# EDIutils 1.5.0

### Enhancement

* __read_tables():__ New arguments to control file parsing: `strip.white` strips leading and trailing whitespaces of unquoted fields, `na.strings` allows specification of strings to be interpreted as NA, `convert.missing.value` converts all missing value codes specified in the EML metadata (e.g. "-99999", "NaN", "Not measured") to NA, `add.units` adds a variable's unit of measurement to the table in a separate column. Default settings read tables in their original published form.

* __replace_missing_value_codes():__ This function will be deprecated in favor of `read_tables(..., convert.missing.value)`, but will persist in the meantime with a deprecation notice.

