# Maplestory SDK utility: feature_add
module MaplestoryUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
