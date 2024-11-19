local M = {}

local template = {
    "# Lectio Divina",
    "",
    "## Lectio (Read)",
    "\"In the beginning was the Word, and the Word was with God, and the Word was God\" - John 1:1",
    "",
    "1. What does the text say?",
    "",
    "- ",
    "- ",
    "- ",
    "",
    "2. Are there any words or phrases that stand out to me?",
    "",
    "- ",
    "- ",
    "- ",
    "",
    "## Meditatio (Reflect)",
    "\"Desire therefore my words; long for them and you will be instructed. Resplendent and unfading is Wisdom\" - Wisdom 6:11-12a",
    "",
    "1. What does the text say to me?",
    "",
    "-",
    "-",
    "-",
    "",
    "## Oratio (Respond)",
    "\"Jesus asked his disciples , 'But who do you say that I am?'\" - Mark 9:29a",
    "",
    "1. What do I want to say to God about the text?",
    "",
    "- ",
    "- ",
    "- ",
    "",
    "## Contemplatio (Rest)",
    "\"Jesus said 'Take my yoke upon you and learn from me, for I am meek and humble of heart; and you will find rest for yourselves.'\" - Matthew 11:29",
    "",
    "1. What difference will this text make in my life?",
    "",
    "- ",
    "- ",
    "- "
}

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function M.lectio(arg)
    vim.api.nvim_buf_set_lines(0, -2, -1, false, template)
    vim.cmd [[:vsplit<cr>]]
    --print(dump(arg))
    -- vim.api.nvim_buf_set_lines(0, -1, -1, false, template)
    if string.find(arg.args, 'today') then
        local x = string.gsub(arg.args,'today','')
        vim.cmd(":%! agape" .. ((x == '' or x == ' ') and '' or (" -i"..x)))
    elseif string.find(arg.args, 'sunday') then
        local x = string.gsub(arg.args,'sunday','')
        vim.cmd(":%! agape -s"..((x == '' or x == ' ') and '' or ("i"..x)))
    else
        vim.cmd(":%! bible-study " .. arg.args)
    end
end

return M
