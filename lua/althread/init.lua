local M = {}

function M.setup(opts)
  opts = opts or {}

  if opts.colorscheme then
    vim.cmd.colorscheme(opts.colorscheme)
  end

  if opts.filetype == true then
    vim.filetype.add({
      extension = {
        alt = "althread",
        althread = "althread",
      },
    })
  end
end

return M
