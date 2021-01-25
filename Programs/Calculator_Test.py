import unittest
from Calculator import add
from Calculator import sub
from Calculator import mul
class Calculator_Test (unittest.TestCase) :
    def test_add(self):
        res = add(3, 4)
        self.assertEqual(res, 7)
    def test_sub(self):
        res = sub(6,2)
        self.assertEqual(res, 4)
    def test_mul(self):
        res = mul(4, 2)
        self.assertEqual(res, 8)


if __name__ == '__main__':
    unittest.main()
