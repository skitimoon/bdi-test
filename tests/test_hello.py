from app import hello


def test_hello(capfd):
    hello.hello()
    assert capfd.readouterr().out == "Hello, World!\n"
