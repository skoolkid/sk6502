import os
import sys
import unittest

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if SKOOLKIT_HOME:
    sys.path.insert(0, SKOOLKIT_HOME)

SK6502_HOME = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
sys.path.insert(0, SK6502_HOME)
from sk6502.snapshot import SnapshotError, can_read, get_snapshot

TMP_FILE = 'snapshot.vsf'

class SnapshotReaderTest(unittest.TestCase):
    def tearDown(self):
        if os.path.isfile(TMP_FILE):
            os.remove(TMP_FILE)

    def test_can_read(self):
        self.assertTrue(can_read('snapshot.vsf'))

    def test_get_snapshot(self):
        vsf = bytearray(b'VICE Snapshot File\x1a')
        vsf.extend([0] * (58 - len(vsf)))
        vsf.extend(b'C64MEM')
        vsf.extend([0] * (84 - len(vsf)))
        ram = [b & 255 for b in range(65536)]
        vsf.extend(ram)
        with open(TMP_FILE, 'wb') as f:
            f.write(vsf)
        snapshot = get_snapshot(TMP_FILE)
        self.assertEqual(ram, snapshot)

    def test_non_vsf(self):
        with open(TMP_FILE, 'wb') as f:
            f.write(b'Not a VICE snapshot file')
        with self.assertRaisesRegex(SnapshotError, '{}: Not a VICE snapshot file'.format(TMP_FILE)):
            get_snapshot(TMP_FILE)

    def test_no_c64mem(self):
        bad_vsf = bytearray(b'VICE Snapshot File\x1a')
        bad_vsf.extend([0] * (76 - len(bad_vsf)))
        bad_vsf.extend((22, 0, 0, 0))
        with open(TMP_FILE, 'wb') as f:
            f.write(bad_vsf)
        with self.assertRaisesRegex(SnapshotError, '{}: C64MEM module not found'.format(TMP_FILE)):
            get_snapshot(TMP_FILE)
