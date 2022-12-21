local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

local M = {}

---Has the same text as the given node
---@param node table
---@return table function_node
M.same = function(node)
  return f(function(args)
    local text = args[1][1] or ""
    return text
  end, node)
end

---Inserts current time
---@param format string
---@return table function_node
M.time = function(format)
  return f(function()
    local date = vim.fn.strftime(format)
    return date
  end)
end

---InsertNode that defaults to current filename
---@param no number
---@return table insert_node
M.ifilename = function(no)
  return i(no, vim.fn.expand("%:t:r"))
end

---InsertNode that defaults to current filename without extension
---@param no number
---@return table insert_node
M.ifilenameNoExt = function(no)
  return i(no, vim.fn.expand("%:t"):gsub("%..*", ""))
end

---InsertNode that defaults to current filename without extension and with upper cased first letter
---@param no number
---@return table insert_node
M.ifilenameNoExtUpper = function(no)
  return i(no, string.upper(vim.fn.expand("%:t"):gsub("%..*", "")))
end

return M
