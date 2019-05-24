local PhysObj = FindMetaTable 'PhysObj'
if not PhysObj then return end

local IsValid = IsValid

function PhysObj.GetBuoyancyRatio(this)
    return IsValid(this) and this.m_fBuoyancyRatio or 0
end

local isnumber, max, min, PhysObj_SetBuoyancyRatio = isnumber, math.max, math.min, PhysObj.SetBuoyancyRatio
function PhysObj.SetBuoyancyRatio(this, ratio)
    if IsValid(this) and isnumber(ratio) then
        this.m_fBuoyancyRatio = min(max(ratio, 0), 1)
        PhysObj_SetBuoyancyRatio(this, ratio)
    end
end