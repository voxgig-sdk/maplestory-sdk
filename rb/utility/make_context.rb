# Maplestory SDK utility: make_context
require_relative '../core/context'
module MaplestoryUtilities
  MakeContext = ->(ctxmap, basectx) {
    MaplestoryContext.new(ctxmap, basectx)
  }
end
