local M = {}

local defaults = {
  filetype = true,
  colorscheme = nil,
  treesitter = {
    enable = true,
    clear_vim_syntax = true,
    fallback_to_vim_syntax = true,
    parser_config = nil,
  },
}

local function register_filetype()
  vim.filetype.add({
    extension = {
      alt = "althread",
      althread = "althread",
    },
  })
end

local function register_parser_config(parser_config)
  if not parser_config then
    return
  end

  local ok, parsers = pcall(require, "nvim-treesitter.parsers")
  if not ok then
    return
  end

  local cfg = parsers.get_parser_configs()
  cfg.althread = vim.tbl_deep_extend("force", cfg.althread or {}, parser_config)
end

local function start_treesitter(bufnr, cfg)
  local has_parser = pcall(vim.treesitter.language.add, "althread")
  if not has_parser then
    if cfg.fallback_to_vim_syntax then
      vim.bo[bufnr].syntax = "althread"
    end
    return false
  end

  -- Guard against invalid highlight queries causing runtime failures.
  local query_ok = pcall(vim.treesitter.query.get, "althread", "highlights")
  if not query_ok then
    if cfg.fallback_to_vim_syntax then
      vim.bo[bufnr].syntax = "althread"
    end
    return false
  end

  local ok = pcall(vim.treesitter.start, bufnr, "althread")
  if ok then
    if cfg.clear_vim_syntax then
      vim.bo[bufnr].syntax = ""
    end
    return true
  end

  if cfg.fallback_to_vim_syntax then
    vim.bo[bufnr].syntax = "althread"
  end

  return false
end

local function setup_treesitter(cfg)
  if not cfg.enable then
    return
  end

  register_parser_config(cfg.parser_config)

  pcall(vim.treesitter.language.register, "althread", "althread")

  local group = vim.api.nvim_create_augroup("althread_treesitter", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "althread",
    callback = function(args)
      start_treesitter(args.buf, cfg)
    end,
  })

  -- Also handle existing buffers when setup() is called after they are open.
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].filetype == "althread" then
      start_treesitter(bufnr, cfg)
    end
  end
end

function M.setup(opts)
  local cfg = vim.tbl_deep_extend("force", defaults, opts or {})

  if cfg.filetype then
    register_filetype()
  end

  setup_treesitter(cfg.treesitter)

  if cfg.colorscheme then
    vim.cmd.colorscheme(cfg.colorscheme)
  end
end

return M
