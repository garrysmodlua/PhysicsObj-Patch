local PhysObj = FindMetaTable 'PhysObj'
if not PhysObj or PhysObj.GetBuoyancyRatio then return end

local IsValid, isnumber = IsValid, isnumber

do
    local DefaultRatio = 0.0 -- TODO: This value should be parsed/read from a model instead of being hardcoded.
    function PhysObj.GetBuoyancyRatio(this)
        return IsValid(this) and isnumber(this.m_fBuoyancyRatio) and this.m_fBuoyancyRatio or DefaultRatio
    end
end

do
    local max, min, PhysObj_SetBuoyancyRatio = math.max, math.min, PhysObj.SetBuoyancyRatio
    function PhysObj.SetBuoyancyRatio(this, ratio)
        if IsValid(this) and isnumber(ratio) and ratio == ratio then
            this.m_fBuoyancyRatio = min(max(ratio, 0.0), 1.0)
            return PhysObj_SetBuoyancyRatio(this, ratio)
        end
    end
end
