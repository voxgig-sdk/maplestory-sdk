# ProjectName SDK exists test

import pytest
from maplestory_sdk import MaplestorySDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = MaplestorySDK.test(None, None)
        assert testsdk is not None
