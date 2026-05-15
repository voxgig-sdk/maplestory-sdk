# Maplestory SDK feature factory

from feature.base_feature import MaplestoryBaseFeature
from feature.test_feature import MaplestoryTestFeature


def _make_feature(name):
    features = {
        "base": lambda: MaplestoryBaseFeature(),
        "test": lambda: MaplestoryTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
