# zabec_test
Test for interview at Zabec.net

A small web service that accepts a paramater userId through query string
(example: localhost/zabec_test/api.php?id=2) and returns all of the user's data.

Unfortunately, I had to use `unset` to remove doubled data from object `$user`,
because I had no better idea of how to do it at the time.
