from skoolkit.snapshot import SnapshotError

# https://vice-emu.sourceforge.io/vice_9.html
VSF_MAGIC = b'VICE Snapshot File\x1a'
C64MEM = b'C64MEM\x00'

def can_read(fname):
    return fname[-4:].lower() == '.vsf'

def get_snapshot(fname, page=None):
    with open(fname, 'rb') as f:
        data = f.read()

    if data[:len(VSF_MAGIC)] != VSF_MAGIC:
        raise SnapshotError('{}: Not a VICE snapshot file'.format(fname))

    i = 58
    while i < len(data):
        if data[i:i + len(C64MEM)] == C64MEM:
            return list(data[i + 26:i + 65562])
        i += data[i + 18] + 256 * data[i + 19] + 65536 * data[i + 20] + 16777216 * data[i + 21]

    raise SnapshotError('{}: C64MEM module not found'.format(fname))
