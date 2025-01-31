require("config.lazy")

function WinBar()
  if vim.fn.expand("%:t") == "" then
    return ""
  end

  -- local path = string.gsub(vim.fn.expand("%:p:h"), vim.fn.getcwd(), "")
  local path = string.sub(vim.fn.expand("%:p:h"), string.len(vim.fn.getcwd()) + 2)
  local splitted = vim.fn.split(path, "/")

  local separator = " / "
  local formatted = ""
  for i, name in ipairs(splitted) do
    formatted = formatted .. separator .. name
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
