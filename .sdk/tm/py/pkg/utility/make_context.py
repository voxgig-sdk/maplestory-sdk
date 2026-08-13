# Maplestory SDK utility: make_context

from projectname_sdk.core.context import MaplestoryContext


def make_context_util(ctxmap, basectx):
    return MaplestoryContext(ctxmap, basectx)
