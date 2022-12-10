local Console = {}

local EMPTY_ENT_ID = INVALID_ID
local EMPTY_EFFECT = ""
local EMPTY_NUM = 0.0


function Console:WriteIf(bool, text)
    -- SenorRagequit 10.12.22
    if bool == true and text ~= NIL then
        ConsoleService:Write(text)
    end
end

return Console