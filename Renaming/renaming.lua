function obfuscate_variables(code)
  local new_names = {}

  -- цикл по всем переменным в коде
  for name, value in pairs(code) do
    if type(value) == "table" then
      obfuscate_variables(value)
    else
      local new_name = generate_random_string()
      while new_names[new_name] or new_name == name do
        new_name = generate_random_string()
      end
      new_names[name] = new_name
      -- заменяем старое название переменной на новое
      code[new_name] = code[name]
      -- удаляем старую переменную
      code[name] = nil
      print(new_name .. " = " .. tostring(code[new_name]))
    end
  end

  return code
end

-- генерация случайного набора символов
function generate_random_string()
  local symbols = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local new_string = ""
  for i = 1, 10 do
    new_string = new_string .. symbols:sub(math.random(1, #symbols), math.random(1, #symbols))
  end
  return new_string
end

function print_table(table)
  for key, value in pairs(table) do
    if type(value) == "table" then
      print(key .. ": {")
      print_table(value)
      print("}")
    else
      print(key .. ": " .. tostring(value))
    end
  end
end

local code = {
  str = "Hello, world",
  b = 9999999999999,
  flag = true,
  dec = 4.5634525353253,
  string = "Hello, world",
  int = 1234243521,
  flagSec = true,
}

print_table(code)
print("/------------------------/")

code = obfuscate_variables(code)