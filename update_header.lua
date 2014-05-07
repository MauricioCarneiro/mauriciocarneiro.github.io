local header_template = "header_template.html"

for i, file in ipairs(arg) do
    if i > 0 then
        print ("Updating " .. file .. "...")
        local out = io.open(file .. ".updated", "w")
        for l in io.lines(header_template) do
            out:write(l .. "\n")
        end
        local skipping_header = true
        for l in io.lines(file) do
            if skipping_header == true then
                if l:sub(1,19) == "<!-FIM_CABECALHO-!>" then
                    skipping_header = false
                end
            else
                out:write(l .. "\n")
            end
        end
        out:close()
        os.execute("mv " .. file .. ".updated" .. " " .. file)
    end
end
