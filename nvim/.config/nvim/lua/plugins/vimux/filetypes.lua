local M = {}

function M.set_js()
  return "node"
end

function M.set_ruby()
  local gemfile = io.open("Gemfile", "r")

  if gemfile then
    gemfile.close()
    return "bundle exec ruby"
  end

  return "ruby"
end

function M.set_rust()
  return "cargo run"
end

M.commands = {
  javascript = M.set_js,
  ruby = M.set_ruby,
  rust = M.set_rust,
}

setmetatable(M.commands, {
  __index = function(_, _)
    return function()
      return "cat"
    end
  end,
})

return M
