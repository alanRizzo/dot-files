local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

local function custom_black()
  return {
    exe = "black",
    args = {
      "--fast",
      "-",
    },
    stdin = true,
  }
end

local function custom_isort()
  return {
    exe = "isort",
    args = {
      "--profile black",
      "-",
    },
    stdin = true,
  }
end

formatter.setup({
  filetype = {
    -- Formatter configurations for filetype go here
    -- and will be executed in order
    python = {
      custom_black,
      custom_isort,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

--TODO: make this work
-- automatically run :PackerSync whenever packages.lua changes
--vim.cmd([[au BufWritePost packages.lua :source <afile> | PackerSync]])
vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = "FormatWrite" })
