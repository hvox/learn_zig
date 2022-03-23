import ctypes
lib = ctypes.cdll.LoadLibrary("./libmyziglib.so")
lib.f()
