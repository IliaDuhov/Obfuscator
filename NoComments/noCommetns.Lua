function remove_comments(code)
  -- создаем таблицу, в которой будет храниться новый код
  local new_code = ""

  -- цикл по всем строкам кода
  for line in code:gmatch("[^\r\n]+") do
    line = line:gsub("%-%-.*", "")
    new_code = new_code .. line .. "\n"
  end

  return new_code
end

local code = [[
-- comment

print("Hello, world!")
flag = true --comment
x = 10
-- new comment
function remove_comments(code)
  -- создаем таблицу, в которой будет храниться новый код
  local new_code = ""

  -- цикл по всем строкам кода
  for line in code:gmatch("[^\r\n]+") do
    line = line:gsub("%-%-.*", "")
    new_code = new_code .. line .. "\n"
  end

  return new_code
end
]]


print(remove_comments(code))
print("\nCode executed successfully!")