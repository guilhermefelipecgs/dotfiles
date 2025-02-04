require("config.lazy")

function WinBar()
  if vim.fn.expand("%:t") == "" then
    return ""
  end

  local only_dir = vim.fn.expand("%:p:h")
  local cwd = vim.fn.getcwd()

  local path = string.sub(only_dir, string.len(cwd) + 2)

  if string.sub(only_dir, 0, string.len(cwd)) ~= cwd then
    path = vim.fn.expand("%:p:h")
  end


  local splitted = vim.fn.split(path, "/")

  local separator = " / "
  local formatted = ""
  local prefix = false

  for i, name in ipairs(splitted) do
    if name == "" then
      prefix = true
      formatted = formatted .. "/"
    else
      if prefix then
        formatted = formatted .. "/ " .. name
        prefix = false
      else
        formatted = formatted .. separator .. name
      end
    end
  end

  if formatted == "" then
    separator = ""
  end

  return "%#Directory#" .. string.sub(formatted, 4) .. separator .. "%#Normal#" .. vim.fn.expand("%:t")
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function(ev)
    if vim.bo.buftype ~= "" then
      return
    end

    vim.opt_local.winbar = WinBar()
  end
})
