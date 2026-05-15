-- Maplestory SDK error

local MaplestoryError = {}
MaplestoryError.__index = MaplestoryError


function MaplestoryError.new(code, msg, ctx)
  local self = setmetatable({}, MaplestoryError)
  self.is_sdk_error = true
  self.sdk = "Maplestory"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function MaplestoryError:error()
  return self.msg
end


function MaplestoryError:__tostring()
  return self.msg
end


return MaplestoryError
