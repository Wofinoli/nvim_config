vim.api.nvim_create_autocmd({"BufEnter"},{
  callback = function(ev)
    if vim.b.starting_word_count == nil then
      vim.b.starting_word_count = vim.fn.wordcount().words
    end
  end
    
})

local function get_words()
  return "here"
end

local function make_statusline()
  local options = {
    "%f", -- filnename
    " %m", -- modified
  }
  
  local options = [[%f %h%w%m%r %=%(%l,%c%V %= %P]]

  if vim.fn.wordcount().visual_words ~= nil then
    options = options .. " Selected %{wordcount().visual_words}"
  end

  options = options .. " %{wordcount().words} words"

  options = options .. "%)"

  options = options .. " (%{wordcount().words - b:starting_word_count})"
--  options = options .. [[ %{nvim_exec_lua("return get_words()", )}]]



  local test = get_words
	local selection_word_count = string.format("%s%s", vim.fn.wordcount().visual_words, " out of ")
	local total_word_count = string.format("%s%s", vim.fn.wordcount().words, " words")

  if selection_word_count ~= "nil out of " then
  end


  return options
  --return table.concat(options, "")
	--return string.format("%s%s%s", filename, selection_word_count, total_word_count)
end

vim.opt.statusline = make_statusline()
