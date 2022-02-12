import gh767
import pytest

def test_handler():
    with pytest.raises(Exception):
        gh767.handler(1)
