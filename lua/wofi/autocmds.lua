-- Auto run Afterwriting on '*.fountain' save.
function some_function(jobid, data, event)
end

  
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*.fountain"},
  callback = function(ev)
--    print(string.format('event fired: %s', vim.inspect(ev)))
    file_path = string.match(ev.match, ".*/")
    file_basename = string.match(ev.match, ".*/(.*)%.fountain")
    pdf_path = file_path .. file_basename .. ".pdf"
--    print(ev.match)
--    print(file_path)
--    print(file_basename)
--    print(pdf_path)
    cmd = 'afterwriting --overwrite --source ' .. ev.match .. ' --pdf ' .. pdf_path
--    print(cmd)
    local job = vim.fn.jobstart(
    cmd, 
    {
        on_exit = some_function,
        on_stdout = some_function,
        on_stderr = some_function
    }
)
  end
})
