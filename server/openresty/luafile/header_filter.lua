-- table类型转成string类型
function TableToStr(t)
    if t == nil then return "" end
    local retstr= "{"

    local i = 1
    for key,value in pairs(t) do
        local signal = ","
        if i==1 then
          signal = ""
        end

        if key == i then
            retstr = retstr..signal..tostring(value)
        else
            if type(key)=='number' or type(key) == 'string' then
                retstr = retstr..signal..'['..tostring(key).."]="..tostring(value)
            else
                if type(key)=='userdata' then
                    retstr = retstr..signal.."*s"..TableToStr(getmetatable(key)).."*e".."="..tostring(value)
                else
                    retstr = retstr..signal..key.."="..tostring(value)
                end
            end
        end

        i = i+1
    end

     retstr = retstr.."}"
     return retstr
end


local h = ngx.resp.get_headers()
for k, v in pairs(h) do
    if type(v)=='table' then
        ngx.var.resp_header=ngx.var.resp_header..";"..k..":"..TableToStr(v)
    else
        ngx.var.resp_header=ngx.var.resp_header..";"..k..":"..v
    end
end
local h2 = ngx.req.get_headers()
for k, v in pairs(h2) do
    if type(v)=='table' then
        ngx.var.req_header=ngx.var.req_header..";"..k..":"..TableToStr(v)
    else
        ngx.var.req_header=ngx.var.req_header..";"..k..":"..v
    end
end